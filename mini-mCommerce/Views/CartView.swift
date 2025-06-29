//
//  CartView.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//


import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.cartItems.isEmpty {
                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(viewModel.cartItems) { item in
                            CartItemRow(
                                item: item,
                                onQuantityChange: { quantity in
                                    viewModel.updateQuantity(for: item, quantity: quantity)
                                },
                                onRemove: {
                                    viewModel.removeItem(item)
                                }
                            )
                        }
                        
                        Section {
                            HStack {
                                Text("Total:")
                                    .font(.headline)
                                Spacer()
                                Text("$\(viewModel.totalPrice, specifier: "%.2f")")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("My Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        //-- Inject mock data into CartService
        let mockService = CartService.shared
        mockService.cartItems = CartItem.mockCartItems
        
        return CartView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
