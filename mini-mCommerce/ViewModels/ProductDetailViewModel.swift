//
//  ProductDetailViewModel.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//

import Foundation

@MainActor
class ProductDetailViewModel: ObservableObject {
    @Published var isAddingToCart = false
        
    func addToCart(_ product: Product) {
        isAddingToCart = true
        
        //-- to simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            CartService.shared.addToCart(product)
            self.isAddingToCart = false
        }
    }
}
