//
//  UIAppearanceExtensions.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 6/19/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit

/// Nested appearance scope for specified trait collection
///
/// - parameter traits: trait collection
/// - parameter block:  appearance code block
public func appearance(for traits: UITraitCollection, _ block: () -> Void) {
    AppearanceScope.main.push(traits)
    block()
    AppearanceScope.main.pop()
}

/// Nested appearance scope for specified container type
///
/// - parameter containerType: container type
/// - parameter block:         appearance code block
public func appearance(in containerType: UIAppearanceContainer.Type, _ block: () -> Void) {
    AppearanceScope.main.push(containerType)
    block()
    AppearanceScope.main.pop()
}

/// Nested appearance scope for specified container chain
///
/// - parameter containerTypes: container chain
/// - parameter block:          appearance code block
public func appearance(inChain containerTypes: [UIAppearanceContainer.Type], _ block: () -> Void) {
    AppearanceScope.main.push(containerTypes)
    block()
    AppearanceScope.main.pop()
}

/// Nested appearance scope for any of specified containers
///
/// - parameter containerTypes: list of containers
/// - parameter block:          appearance code block
public func appearance(inAny containerTypes: [UIAppearanceContainer.Type], _ block: () -> Void) {
    for container in containerTypes {
        appearance(in: container, block)
    }
}

public extension UIAppearanceContainer {
    
    /// Nested appearance scope for `Self` container
    ///
    /// - parameter block: appearance code block for current container
    public static func appearance(_ block: () -> Void) {
        AppearanceScope.main.push(self)
        block()
        AppearanceScope.main.pop()
    }
}

public extension UIAppearance where Self: UIAppearanceContainer {
    
    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container
    ///
    /// - parameter block: appearance code block for current container
    /// - parameter proxy: appearance proxy to configure
    public static func appearance(_ block: (_ proxy: Self) -> Void) {
        let context = AppearanceScope.main.context
        let proxy = appearance(context: context)
        AppearanceScope.main.push(self)
        block(proxy)
        AppearanceScope.main.pop()
    }
}

public extension UIAppearance {

    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container if applicable
    ///
    /// - parameter block: appearance code block for current container
    /// - parameter proxy: appearance proxy to configure
    public static func appearance(_ block: (_ proxy: Self) -> Void) {
        let context = AppearanceScope.main.context
        let proxy = appearance(context: context)
        if let selfContainerType = self as? UIAppearanceContainer.Type {
            AppearanceScope.main.push(selfContainerType)
            block(proxy)
            AppearanceScope.main.pop()
        } else {
            block(proxy)
        }
    }
    
    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container with specified trait collection
    ///
    /// - parameter traits: trait collections
    /// - parameter block:  appearance code block for current container
    /// - parameter proxy:  appearance proxy to configure
    public static func appearance(for traits: UITraitCollection, _ block: (_ proxy: Self) -> Void) {
        AppearanceScope.main.push(traits)
        appearance(block)
        AppearanceScope.main.pop()
    }
    
    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container inside specified container type
    ///
    /// - parameter containerType: container type
    /// - parameter block:         appearance code block for current container
    /// - parameter proxy:         appearance proxy to configure
    public static func appearance(in containerType: UIAppearanceContainer.Type, _ block: (_ proxy: Self) -> Void) {
        AppearanceScope.main.push(containerType)
        appearance(block)
        AppearanceScope.main.pop()
    }
    
    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container inside specified container chain
    ///
    /// - parameter containerTypes: container chain
    /// - parameter block:          appearance code block for current container
    /// - parameter proxy:          appearance proxy to configure
    public static func appearance(inChain containerTypes: [UIAppearanceContainer.Type], _ block: (_ proxy: Self) -> Void) {
        AppearanceScope.main.push(containerTypes)
        appearance(block)
        AppearanceScope.main.pop()
    }
    
    /// Configure appearance for `Self` type and start
    /// nested appearance scope for `Self` container inside any of specified containers
    ///
    /// - parameter containerTypes: list of containers
    /// - parameter block:          appearance code block for current container
    /// - parameter proxy:          appearance proxy to configure
    public static func appearance(inAny containerTypes: [UIAppearanceContainer.Type], _ block: (_ proxy: Self) -> Void) {
        for container in containerTypes {
            appearance(in: container, block)
        }
    }
}
