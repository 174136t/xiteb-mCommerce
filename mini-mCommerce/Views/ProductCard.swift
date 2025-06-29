//
//  ProductCard.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//


import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 12) {
            //-- Product image
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        ProgressView()
                            .scaleEffect(0.8)
                    )
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            //-- Product title
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                //-- Product price
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product.mockProduct)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
