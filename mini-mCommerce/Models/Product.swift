//
//  Product.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
