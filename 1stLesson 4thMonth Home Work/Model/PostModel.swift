//
//  PostModel.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 24/2/23.
//

import UIKit

struct ProductsGroup: Decodable {
    let products: [Products]
}
struct Products: Decodable {
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
//    let image: String
}
