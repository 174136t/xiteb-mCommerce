//
//  CartItem.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

struct CartItem: Identifiable, Codable {
    let id = UUID()
    let product: Product
    var quantity: Int
    
    var totalPrice: Double {
        product.price * Double(quantity)
    }
    
    //-- Custom coding keys to handle UUID
    enum CodingKeys: String, CodingKey {
        case product, quantity
    }
    
    // Custom decoder to generate new UUID when loading
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        product = try container.decode(Product.self, forKey: .product)
        quantity = try container.decode(Int.self, forKey: .quantity)
    }
    
    //-- Custom encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(product, forKey: .product)
        try container.encode(quantity, forKey: .quantity)
    }
    
    //-- Regular initializer
    init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}
