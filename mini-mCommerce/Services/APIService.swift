//
//  APIService.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import Foundation

class APIService{
    static let shared = APIService()
    private let mockURL = "https://fakestoreapi.com"
    
    //-- to fetch all products
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "\(mockURL)/products") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
    
    //-- to fetch only relevant product if needed
    func fetchProduct(id: Int) async throws -> Product {
        guard let url = URL(string: "\(mockURL)/products/\(id)") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Product.self, from: data)
    }
}

enum APIError:Error{
    case invalidURL
    case noData
}
