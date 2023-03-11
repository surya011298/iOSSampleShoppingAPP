//
//  Product.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import Foundation

struct ProductResponse: Codable {
    let data: ProductData
}

struct ProductData: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: String
    let brand: String
    let name: String
    let productDesc: String
    let price: String
    let offerPrice: String
    let productUrl: String
}
