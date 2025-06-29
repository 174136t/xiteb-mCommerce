//
//  CartItemRow.swift
//  mini-mCommerce
//
//  Created by Lahiru Neranjan on 2025-06-29.
//


import SwiftUI

struct CartItemRow: View {
    let item: CartItem
    let onQuantityChange: (Int) -> Void
    let onRemove: () -> Void
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                //-- Product image
                AsyncImage(url: URL(string: item.product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.2))
                        .overlay(
                            ProgressView()
                                .scaleEffect(0.6)
                        )
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                
                //-- Product details
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.product.title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(2)
                    
                    Text("$\(item.product.price, specifier: "%.2f") each")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Total: $\(item.totalPrice, specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                //-- Quantity controls and remove button
                VStack(spacing: 8) {
                    //-- Quantity stepper
                    HStack(spacing: 0) {
                        Button(action: {
                            if item.quantity > 1 {
                                onQuantityChange(item.quantity - 1)
                            }
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(item.quantity > 1 ? .blue : .gray)
                                .font(.title3)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .disabled(item.quantity <= 1)
                        
                        Text("\(item.quantity)")
                            .font(.headline)
                            .frame(minWidth: 30)
                        
                        Button(action: {
                            onQuantityChange(item.quantity + 1)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                    //-- Remove item button
                    Button(action: onRemove) {
                        HStack(spacing: 4) {
                            Image(systemName: "trash")
                            Text("Remove")
                        }
                        .font(.caption)
                        .foregroundColor(.red)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
        }
        .padding(.vertical, 8)
    }
}


struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CartItemRow(
            item: CartItem(product: Product.mockProduct, quantity: 2),
            onQuantityChange: { _ in },
            onRemove: { }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
