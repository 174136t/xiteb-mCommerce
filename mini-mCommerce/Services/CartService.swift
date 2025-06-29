//
//  CartService.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

class CartService: ObservableObject{
    static let shared = CartService()
    @Published var cartItems: [CartItem] = [] {
        didSet {
            //-- Auto saving to userdefaults whenever the cart items are changing
            saveCart()
        }
    }
    
    private let cartKey = "cart_items"
    
    private init(){
        //-- Loading the saved cart when cart service initializes
        loadCart()
    }
    
    func addToCart(_ product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
        cartItems = cartItems
    }
    
    func removeFromCart(_ cartItem: CartItem) {
        cartItems.removeAll { $0.id == cartItem.id }
        cartItems = cartItems
    }
    
    func updateQuantity(for cartItem: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            if quantity > 0 {
                cartItems[index].quantity = quantity
            } else {
                removeFromCart(cartItem)
            }
        }
        cartItems = cartItems
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.totalPrice }
    }
    
    var totalItems: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    func saveCart() {
        do {
            let data = try JSONEncoder().encode(cartItems)
            UserDefaults.standard.set(data, forKey: cartKey)
            print("Cart saved successfully with \(cartItems.count) items")
        } catch {
            print("Failed to save cart: \(error.localizedDescription)")
        }
    }
    
    func loadCart() {
        guard let data = UserDefaults.standard.data(forKey: cartKey) else {
            print("No saved cart found - so starting with empty cart")
            return
        }
        
        do {
            cartItems = try JSONDecoder().decode([CartItem].self, from: data)
            print("Cart loaded successfully with \(cartItems.count) items")
        } catch {
            print("Failed to load saved cart: \(error.localizedDescription)")
            cartItems = []
        }
    }
}
