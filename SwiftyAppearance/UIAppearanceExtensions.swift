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
    containerTypes.forEach {
        appearance(inChain: [$0], block)
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
        AppearanceScope.main.push([Self.self])
        block(proxy)
        AppearanceScope.main.pop()
    }
}

public extension UIAppearanceContainer {
    
    /// Nested appearance scope for `Self` container
    ///
    /// - parameter block: appearance code block for current container
    public static func appearance(_ block: () -> Void) {
        AppearanceScope.main.push([Self.self])
        block()
        AppearanceScope.main.pop()
    }
}

public extension UIAppearance {

    /// Configure appearance for `Self` type
    ///
    /// - parameter block: appearance code block for current container
    /// - parameter proxy: appearance proxy to configure
    public static func appearance(_ block: (_ proxy: Self) -> Void) {
        let context = AppearanceScope.main.context
        let proxy = appearance(context: context)
        block(proxy)
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
    /// nested appearance scope for `Self` container inside specofoed container chain
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
    /// nested appearance scope for `Self` container inside any of specofied containers
    ///
    /// - parameter containerTypes: list of containers
    /// - parameter block:          appearance code block for current container
    /// - parameter proxy:          appearance proxy to configure
    public static func appearance(inAny containerTypes: [UIAppearanceContainer.Type], _ block: (_ proxy: Self) -> Void) {
        containerTypes.forEach {
            appearance(inChain: [$0], block)
        }
    }
}
