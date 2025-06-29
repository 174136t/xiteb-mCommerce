//
//  CartItem.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
    
    var totalPrice: Double {
        product.price * Double(quantity)
    }
}
