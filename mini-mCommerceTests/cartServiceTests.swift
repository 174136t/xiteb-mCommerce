//
//  cartServiceTests.swift
//  mini-mCommerceTests
//
//  Created by Lahiru Neranjan on 2025-06-28.
//

import XCTest
@testable import mini_mCommerce

final class cartServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddToCart() {
        let cartService = CartService.shared
        let product = Product.mockProduct
        
        cartService.addToCart(product)
        
        XCTAssertEqual(cartService.cartItems.count, 1)
        XCTAssertEqual(cartService.cartItems.first?.product.id, product.id)
    }
    
    func testRemoveFromCart() {
        let cartService = CartService.shared
        let product = Product.mockProduct
        cartService.addToCart(product)
        
        let item = cartService.cartItems.first!
        cartService.removeFromCart(item)
        
        XCTAssertTrue(cartService.cartItems.isEmpty)
    }

    func testUpdateQuantity() {
        let cartService = CartService.shared
        let product = Product.mockProduct
        
        cartService.addToCart(product)
        XCTAssertEqual(cartService.cartItems.count, 1)
        XCTAssertEqual(cartService.cartItems.first?.quantity, 1)

        if let item = cartService.cartItems.first {
            cartService.updateQuantity(for: item, quantity: 3)
        }

        XCTAssertEqual(cartService.cartItems.count, 1, "Cart should still contain the item which added")
        XCTAssertEqual(cartService.cartItems.first?.quantity, 3, "Quantity should be updated to 3")
    }

    
}
