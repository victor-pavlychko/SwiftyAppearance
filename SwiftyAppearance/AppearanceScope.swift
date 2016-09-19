//
//  AppearanceScope.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 9/18/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

struct AppearanceScope {
    
    public static var main = AppearanceScope()
    
    struct Context {
        var containerTypes: [UIAppearanceContainer.Type] = []
        var traits: [UITraitCollection] = []
    }
    
    private enum StackItem {
        case containerTypes(Int)
        case traits
    }

    private(set) var context = Context()
    private var stack: [StackItem] = []
    
    mutating func push(_ containerTypes: [UIAppearanceContainer.Type]) {
        context.containerTypes.append(contentsOf: containerTypes)
        stack.append(.containerTypes(containerTypes.count))
    }
    
    mutating func push(_ traits: UITraitCollection) {
        context.traits.append(traits)
        stack.append(.traits)
    }
    
    mutating func pop() {
        switch stack.removeLast() {
        case .containerTypes(let count):
            context.containerTypes.removeLast(count)
        case .traits:
            context.traits.removeLast()
        }
    }
}

extension UIAppearance {
    
    static func appearance(context: AppearanceScope.Context) -> Self {
        if context.traits.isEmpty {
            return context.containerTypes.count > 0
                ? appearance(whenContainedInInstancesOf: context.containerTypes)
                : appearance()
        }
        
        let traits = UITraitCollection(traitsFrom: context.traits)
        return context.containerTypes.count > 0
            ? appearance(for: traits, whenContainedInInstancesOf: context.containerTypes)
            : appearance(for: traits)
    }
}
