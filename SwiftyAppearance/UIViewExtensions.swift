//
//  UIViewExtensions.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 11/27/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public extension UIView {

    /// Reloads UIApperance of subviews
    func refreshSubviewAppearance() {
        let constraints = self.constraints
        removeConstraints(constraints)
        for subview in subviews {
            subview.removeFromSuperview()
            subview.refreshSubviewAppearance()
            addSubview(subview)
        }
        addConstraints(constraints)
    }
}

public extension UIApplication {

    /// Reloads UIApperance of the key window
    func refreshAppearance() {
        keyWindow?.refreshSubviewAppearance()
    }
}
