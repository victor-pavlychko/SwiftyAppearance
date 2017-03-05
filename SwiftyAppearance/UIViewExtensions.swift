//
//  UIViewExtensions.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 11/27/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public extension NSNotification.Name {
    
    public static let SwiftyAppearanceWillRefreshView = NSNotification.Name(rawValue: "SwiftyAppearanceWillRefreshViewNotification")
    public static let SwiftyAppearanceDidRefreshView = NSNotification.Name(rawValue: "SwiftyAppearanceDidRefreshViewNotification")
    public static let SwiftyAppearanceWillRefresh = NSNotification.Name(rawValue: "SwiftyAppearanceWillRefreshNotification")
    public static let SwiftyAppearanceDidRefresh = NSNotification.Name(rawValue: "SwiftyAppearanceDidRefreshNotification")
}

public extension UIView {

    fileprivate func _refreshSubviewAppearance() {
        let constraints = self.constraints
        removeConstraints(constraints)
        for subview in subviews {
            subview.removeFromSuperview()
            addSubview(subview)
        }
        addConstraints(constraints)
    }
    
    /// Reloads UIApperance of all subviews
    public func refreshSubviewAppearance() {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefreshView, object: self)
        _refreshSubviewAppearance()
        NotificationCenter.default.post(name: .SwiftyAppearanceDidRefreshView, object: self)
    }
    
    /// Reloads UIApperance of all subviews with animation
    public func refreshSubviewAppearance(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.refreshSubviewAppearance()
        }
    }
}

public extension UIApplication {

    /// Reloads UIApperance of all windows
    public func refreshApplicationAppearance() {
        NotificationCenter.default.post(name: .SwiftyAppearanceWillRefresh, object: nil)
        for window in windows {
            window._refreshSubviewAppearance()
        }
        NotificationCenter.default.post(name: .SwiftyAppearanceDidRefresh, object: nil)
    }

    /// Reloads UIApperance of all windows with animation
    public func refreshApplicationAppearance(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { 
            self.refreshApplicationAppearance()
        }
    }
}
