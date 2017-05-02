//
//  UIWindowExtensions.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 5/2/17.
//  Copyright © 2017 address.wtf. All rights reserved.
//

import UIKit

public extension NSNotification.Name {
    
    /// <#Description#>
    public static let SwiftyAppearanceWillRefreshWindow = NSNotification.Name(rawValue: "SwiftyAppearanceWillRefreshWindowNotification")
 
    /// <#Description#>
    public static let SwiftyAppearanceDidRefreshWindow = NSNotification.Name(rawValue: "SwiftyAppearanceDidRefreshWindowNotification")
}

public extension UIWindow {
    
    private func _refreshAppearance() {
        let constraints = self.constraints
        removeConstraints(constraints)
        for subview in subviews {
            subview.removeFromSuperview()
            addSubview(subview)
        }
        addConstraints(constraints)
    }
    
    /// Reloads UIApperance of the window
    public func refreshAppearance() {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefreshWindow, object: self)
        _refreshAppearance()
        NotificationCenter.default.post(name: .SwiftyAppearanceDidRefreshWindow, object: self)
    }
    
    /// Reloads UIApperance of the window with animation
    public func refreshAppearance(duration: TimeInterval) {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefreshWindow, object: self)
        UIView.animate(withDuration: duration, animations: {
            self._refreshAppearance()
        }, completion: { finished in
            if finished {
                NotificationCenter.default.post(name: .SwiftyAppearanceDidRefreshWindow, object: self)
            }
        })
    }
}
