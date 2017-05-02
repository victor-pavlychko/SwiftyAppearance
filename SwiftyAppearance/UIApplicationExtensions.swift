//
//  UIApplicationExtensions.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 5/2/17.
//  Copyright © 2017 address.wtf. All rights reserved.
//

import UIKit

public extension NSNotification.Name {
    
    /// <#Description#>
    public static let SwiftyAppearanceWillRefresh = NSNotification.Name(rawValue: "SwiftyAppearanceWillRefreshNotification")
    
    /// <#Description#>
    public static let SwiftyAppearanceDidRefresh = NSNotification.Name(rawValue: "SwiftyAppearanceDidRefreshNotification")
}

public extension UIApplication {
    
    private func _refreshAppearance() {
        for window in windows {
            window.refreshAppearance()
        }
    }
    
    /// Reloads UIApperance of all windows in the application
    public func refreshAppearance() {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefresh, object: self)
        _refreshAppearance()
        NotificationCenter.default.post(name: .SwiftyAppearanceDidRefresh, object: self)
    }
    
    /// Reloads UIApperance of all windows in the application with animation
    public func refreshAppearance(duration: TimeInterval) {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefresh, object: self)
        UIView.animate(withDuration: duration, animations: {
            self._refreshAppearance()
        }, completion: { finished in
            if finished {
                NotificationCenter.default.post(name: .SwiftyAppearanceDidRefresh, object: self)
            }
        })
    }
}
