# xiteb-mCommerce
Mini mCommerce iOS Application

## Requirements
- macOS with Xcode installed (Xcode 14 or later recommended)
- Swift 5 or later
- Git
- iOS 15+
  
## Setup Instructions
1. Clone the repository:
- git clone https://github.com/174136t/xiteb-mCommerce.git
- cd xiteb-mCommerce

Or use SSH if configured:
- git clone git@github.com:174136t/xiteb-mCommerce.git

2. Open mini-mCommerce.xcodeproj in Xcode
3. Build and run on iOS Simulator or device

## Libraries Used
- Native iOS frameworks only (SwiftUI, Combine, Foundation)
- FakeStore API for product data

## Architecture
- MVVM pattern with Combine for reactive programming
- Service layer for API and business logic
- SwiftUI for declarative UI
- async/await for network operations
- UserDefaults for local persistence

## Features
- Product listing with images, names and prices
- Detailed product view with ratings and descriptions
- Shopping cart with quantity management
- Modern iOS UI with native navigation

## Time Taken
Approximately 11-12 hours for complete implementation

## Testing
- Unit tests for CartService methods - (AddToCart, RemoveFromCart and UpdateQuantity)
