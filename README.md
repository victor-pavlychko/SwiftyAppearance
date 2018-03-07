# SwiftyAppearance

[![Pod Version](https://img.shields.io/cocoapods/v/SwiftyAppearance.svg?style=flat)](http://cocoapods.org/pods/SwiftyAppearance)
[![Carthage: compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-3b3b3b.svg?style=flat)](https://github.com/victor-pavlychko/SwiftyAppearance/blob/master/LICENSE)
[![Swift: 4.0](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://github.com/victor-pavlychko/SwiftyAppearance)
[![Platform: iOS](https://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat)](https://github.com/victor-pavlychko/SwiftyAppearance)

`UIAppearance` allows to configure global application look and feel in a single centralized location instead of
spreading bits of design across different classes, xibs and storyboards.

SwiftyAppearance adds a little bit of style to this approach.

## Example

To run the example project, clone the repo and run `SwiftAppearanceDemo` app:

<img src="https://raw.githubusercontent.com/victor-pavlychko/SwiftyAppearance/master/Screenshots/first.png" width="320px">
<img src="https://raw.githubusercontent.com/victor-pavlychko/SwiftyAppearance/master/Screenshots/second.png" width="320px">

## Brief Walkthrough

To achieve best results with `UIAppearance`, avoid inheriting from UIKit base classes directly and insert custom
base classes instead. Consider class hierarchy like this: `UIViewController` → `AppViewController` → `UserListViewController`.
Doing so allows applying appearance to all view controllers across the app while leaving third‐party screens
like SMS or mail composers intact.

Also it is useful to create custom "background view" class to be used instead of `UIView` as a root view for most
view controllers. This allows to customize view controller backgrounds globally and does not affect other views. 

Demo application defines following root classes for global styling:
* `AppViewController`
* `AppTabBarController`
* `AppNavigationController`
* `AppBackgroundView`

```swift
appearance(inAny: [AppViewController.self, AppTabBarController.self, AppNavigationController.self]) {
    UITabBar.appearance {
        $0.barStyle = .black
        $0.barTintColor = UIColor(rgb: 0x2c3e50)
        $0.tintColor = UIColor(rgb: 0xecf0f1)
    }
}
```

Also we define two navigation controller subclasses for different screens:
* `FirstNavigationController`
* `SecondNavigationController`

```swift
FirstNavigationController.appearance {
    UINavigationBar.appearance {
        $0.barStyle = .black
        $0.barTintColor = UIColor(rgb: 0x2980b9)
        $0.tintColor = UIColor(rgb: 0xecf0f1)
    }
}
```

```swift
SecondNavigationController.appearance {
    UINavigationBar.appearance {
        $0.barStyle = .`default`
        $0.barTintColor = UIColor(rgb: 0xf39c12)
        $0.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(rgb: 0xc0392b)]
    }
}
```

And finally we customize our view controllers:

```swift
FirstViewController.appearance {
    AppBackgroundView.appearance {
        $0.backgroundColor = UIColor(rgb: 0xecf0f1)
        $0.tintColor = UIColor(rgb: 0x34495e)
    }
    UILabel.appearance {
        $0.textColor = UIColor(rgb: 0x2c3e50)
    }
}
```

```swift
SecondViewController.appearance {
    AppBackgroundView.appearance {
        $0.backgroundColor = UIColor(rgb: 0xf1c40f)
    }
    UILabel.appearance {
        $0.textColor = UIColor(rgb: 0xe67e22)
    }
}
```

## API Overview

SwiftyAppearance defines a set of functions to handle nested appearance scopes. Each scope defines more specific
case — either by adding nested container, or by adding some traits.

Free functions and UIAppearanceContainer Extensions just introduce nested scopes while UIAppearance Extensions also
provide proxy object to configure its properties.

### Free Functions

* `func appearance(for traitCollection: UITraitCollection? = nil, in containerTypes: [UIAppearanceContainer.Type] = [], _ block: () -> Void)` — adds traits and containers from the collection to the scope
* `func appearance(for traitCollection: UITraitCollection? = nil, inAny containerTypes: [UIAppearanceContainer.Type], _ block: () -> Void)` — adds traits and defines a set of nested scopes for each provided container

### UIAppearance  and UIAppearanceContainer Extensions

* `static func UIAppearanceContainer.appearance(style: AppearanceStyle = nil, for traitCollection: UITraitCollection? = nil, _ block: () -> Void)` — adds nested container to the scope optionally specifying style
* `static func UIAppearance.appearance(style: AppearanceStyle = nil, for traitCollection: UITraitCollection? = nil, _ block: (_ proxy: Self) -> Void)` — adds traits from the collection to the scope, provides appearance proxy for class with an optional style class, then adds current class as a container
    if applicable

### UIWindow and UIApplication Extensions

* `func UIWindow.refreshAppearance(animated: Bool)` — refreshes appearance for the window
* `func UIApplication.refreshAppearance(animated: Bool)` — refreshes appearance for all windows in the application

### UIView and UIViewController Extensions

* `@IBInspectable public var appearanceStyleName: String` — inspectable property to set appearance style from Interface Builder
* `var appearanceStyle: AppearanceStyle` — appearance style accessor
* `func setAppearanceStyle(_ style: AppearanceStyle, animated: Bool)` — sets appearance style optionally animating the update

## Installation

### CocoaPods

To integrate SwiftyAppearance into your Xcode project using [CocoaPods](http://cocoapods.org), add the following line to your Podfile:

```ruby
pod "SwiftyAppearance"
```

### Carthage

To integrate SwiftyAppearance into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "victor-pavlychko/SwiftyAppearance"
```

### Just Copy Files

SwiftyAppearance consists of two files and has no external dependencies.
You can just copy files into your project.

## Author

Victor Pavlychko, victor.pavlychko@gmail.com

## License

SwiftyAppearance is available under the MIT license. See the LICENSE file for more info.
