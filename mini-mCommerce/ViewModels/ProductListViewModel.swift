//
//  ProductListViewModel.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products:[Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchProducts() async {
        isLoading = true
        errorMessage = nil
        
        do {
            products = try await APIService.shared.fetchProducts()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
