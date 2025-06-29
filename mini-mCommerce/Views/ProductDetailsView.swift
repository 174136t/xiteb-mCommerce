//
//  ProductDetailsView.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//


import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    @StateObject private var viewModel = ProductDetailViewModel()
    
    var body: some View {
        ScrollView {
            //-- Product image
            VStack(alignment: .leading, spacing: 16) {
                HStack{
                    Spacer()
                    AsyncImage(url: URL(string: product.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Text(product.category.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(8)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(product.rating.rate, specifier: "%.1f")")
                        Text("(\(product.rating.count) reviews)")
                            .foregroundColor(.gray)
                    }
                    
                    Text(product.description)
                        .font(.body)
                        .padding(.top)
                }
                .padding()
                
                //-- Add to cart button
                Button(action: {
                    viewModel.addToCart(product)
                }) {
                    HStack {
                        if viewModel.isAddingToCart {
                            ProgressView()
                                .scaleEffect(0.8)
                        }
                        Text(viewModel.isAddingToCart ? "Adding..." : "Add to Cart")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(viewModel.isAddingToCart)
                .padding()
            }
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: Product.mockProduct)
    }
}
