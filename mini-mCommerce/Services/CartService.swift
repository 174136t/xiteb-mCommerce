//
//  CartService.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

class CartService: ObservableObject{
    static let shared = CartService()
    @Published var cartItems: [CartItem] = []
    
    private init(){}
    
    func addToCart(_ product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(_ cartItem: CartItem) {
        cartItems.removeAll { $0.id == cartItem.id }
    }
    
    func updateQuantity(for cartItem: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            if quantity > 0 {
                cartItems[index].quantity = quantity
            } else {
                removeFromCart(cartItem)
            }
        }
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.totalPrice }
    }
    
    var totalItems: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
}
