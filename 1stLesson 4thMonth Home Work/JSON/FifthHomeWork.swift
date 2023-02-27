//
//  FifthHomeWork.swift
//  1stLesson 4thMonth Home Work
//
//  Created by Islam on 25/2/23.
//

import Foundation
let productJSON = """
{
   "products": [
        {
        "productName": "Burger Craze",
        "openClose": "Open",
        "time": "15-20",
        "comment": "4.6(601)",
        "typeOfBurger": "American : Burgers",
        "delivery": "Delovery: Free",
        "price": "Minimum 10$",
        "locationOfDelivery": "1.5 km away"
        },
        {
        "productName": "Vegetarian Pizza",
        "openClose": "Open",
        "time": "10-15",
        "comment": "4.6(600)",
        "typeOfBurger": "Italian : Burgers",
        "delivery": "Delovery: Free",
        "price": "Minimum 10$",
        "locationOfDelivery": "1.5 km away"
        }
   ]
}
"""

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    private init() {
    }
        
    func fetchproduct() throws -> [Product] {
        let decoder = JSONDecoder()
        let product = try decoder.decode([Product].self, from: Data(productJSON.utf8))
        return product
    }
}
