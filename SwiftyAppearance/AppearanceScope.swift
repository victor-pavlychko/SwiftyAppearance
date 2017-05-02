//
//  AppearanceScope.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 9/18/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit

internal struct AppearanceScope {
    
    internal static var main = AppearanceScope()
    
    internal struct Context {
        var containerTypes: [UIAppearanceContainer.Type] = []
        var traits: [UITraitCollection] = []
    }
    
    private enum UnwindStackItem {
        case containerTypes(Int)
        case traits
    }

    private var _context = Context()
    private var _unwindStack: [UnwindStackItem] = []
    
    internal var context: Context {
        return _context
    }
    
    internal mutating func push(_ containerType: UIAppearanceContainer.Type) {
        _context.containerTypes.append(containerType)
        _unwindStack.append(.containerTypes(1))
    }
    
    internal mutating func push(_ containerTypes: [UIAppearanceContainer.Type]) {
        _context.containerTypes.append(contentsOf: containerTypes)
        _unwindStack.append(.containerTypes(containerTypes.count))
    }
    
    internal mutating func push(_ traits: UITraitCollection) {
        _context.traits.append(traits)
        _unwindStack.append(.traits)
    }
    
    internal mutating func pop() {
        switch _unwindStack.removeLast() {
        case let .containerTypes(count):
            _context.containerTypes.removeLast(count)
        case .traits:
            _context.traits.removeLast()
        }
    }
}

internal extension UIAppearance {
    
    internal static func appearance(context: AppearanceScope.Context) -> Self {
        guard !context.traits.isEmpty else {
            return !context.containerTypes.isEmpty
                ? appearance(whenContainedInInstancesOf: context.containerTypes.reversed())
                : appearance()
        }
        
        let traits = UITraitCollection(traitsFrom: context.traits)
        return !context.containerTypes.isEmpty
            ? appearance(for: traits, whenContainedInInstancesOf: context.containerTypes.reversed())
            : appearance(for: traits)
    }
}
