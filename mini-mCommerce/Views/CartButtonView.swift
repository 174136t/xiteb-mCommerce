//
//  CartButtonView.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//


import SwiftUI

struct CartButtonView: View {
    @ObservedObject private var cartService = CartService.shared
    
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .font(.title3)
                .foregroundColor(.primary)
            
            if cartService.totalItems > 0 {
                Text("\(cartService.totalItems)")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 12, y: -12)
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        //-- Inject mock data into CartService
        let mockService = CartService.shared
        mockService.cartItems = CartItem.mockCartItems
        
        return CartButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Cart with Items")
    }
}
