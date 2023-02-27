//
//  PostJSON.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 27/2/23.
//

import Foundation

final class ServerLayer {
    static let shared = ServerLayer()
    
    private init() {}
    
    private var url = URL(string: "https://dummyjson.com/products")
    
    func fetchPosts(completion: @escaping (Result<ProductsGroup, Error>) -> Void) {
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                self.decodeData(data: data, completion: completion)
            }
        }.resume()
    }
    
    func findProductsData(
        text: String,
        completion: @escaping (Result<ProductsGroup, Error>) -> Void
    ) {
        guard let url = url else { return }
        let urlQueryItem = URLQueryItem(name: "q", value: text)
        
        let request = URLRequest(url: url.appendingPathComponent("search").appending(queryItems: [urlQueryItem]))
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            self.decodeData(data: data, completion: completion)
        }
        task.resume()
    }
    
    func findAsync(text: String) async throws -> ProductsGroup {
        guard let url = url else { return ProductsGroup(products: []) }
        let urlQueryItem = URLQueryItem(name: "q", value: text)
        
        let request = URLRequest(url: url.appendingPathComponent("search").appending(queryItems: [urlQueryItem]))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(response)
        return try decode(data: data)
        
    }
    
    func decode<T:Decodable>(data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
    

    func decodeData<T: Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}
