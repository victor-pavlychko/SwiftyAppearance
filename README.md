# SwiftyAppearance

[![Version](https://img.shields.io/cocoapods/v/SwiftyAppearance.svg?style=flat)](http://cocoapods.org/pods/SwiftyAppearance)
[![License](https://img.shields.io/cocoapods/l/SwiftyAppearance.svg?style=flat)](http://cocoapods.org/pods/SwiftyAppearance)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyAppearance.svg?style=flat)](http://cocoapods.org/pods/SwiftyAppearance)

## Example

To run the example project, clone the repo, and run `SwiftAppearanceDemo` app.

```swift
appearance(inAny: [AppViewController.self, AppTabBarController.self]) {
    UIView.appearance {
        $0.tintColor = .magenta
    }
    UITabBar.appearance {
        $0.barStyle = .black
        $0.barTintColor = .red
        $0.tintColor = .white
    }
}

FirstViewController.appearance {
    UILabel.appearance {
        $0.textColor = .blue
    }
}

SecondViewController.appearance {
    UILabel.appearance {
        $0.textColor = .green
    }
}
```

## Installation

SwiftyAppearance is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftyAppearance"
```

## Author

Victor Pavlychko, victor.pavlychko@gmail.com

## License

SwiftyAppearance is available under the MIT license. See the LICENSE file for more info.
