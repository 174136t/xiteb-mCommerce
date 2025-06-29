//
//  Extensions.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//

import Foundation

// MARK: - Product Extensions
extension Product {
    static let mockProduct = Product(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: Rating(rate: 3.9, count: 120)
    )
    
    static let mockProducts = [
        Product(id: 1, title: "Backpack", price: 109.95, description: "Great backpack", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 120)),
        Product(id: 2, title: "T-Shirt", price: 22.3, description: "Comfortable t-shirt", category: "men's clothing", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 4.1, count: 259)),
        Product(id: 3, title: "Cotton Jacket", price: 55.99, description: "Great outerwear", category: "men's clothing", image: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg", rating: Rating(rate: 4.7, count: 500)),
    ]
}

// MARK: - CartItem Extensions
extension CartItem {
    static let mockCartItem = CartItem(product: Product.mockProduct, quantity: 2)
    
    static let mockCartItems = [
        CartItem(product: Product.mockProducts[0], quantity: 1),
        CartItem(product: Product.mockProducts[1], quantity: 2),
        CartItem(product: Product.mockProducts[2], quantity: 1),
    ]
}
