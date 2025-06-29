//
//  CartViewModel.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//

import Foundation
import Combine

@MainActor
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    @Published var totalPrice: Double = 0
    
    private let cartService = CartService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        cartService.$cartItems
            .sink { [weak self] items in
                self?.cartItems = items
                self?.totalPrice = self?.cartService.totalPrice ?? 0
            }
            .store(in: &cancellables)
    }
    
    func updateQuantity(for item: CartItem, quantity: Int) {
        cartService.updateQuantity(for: item, quantity: quantity)
    }
    
    func removeItem(_ item: CartItem) {
        cartService.removeFromCart(item)
    }
}
