//
//  AppearanceView.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 5/2/17.
//  Copyright © 2017 address.wtf. All rights reserved.
//

import UIKit

/// <#Description#>
open class AppearanceStyleView: UIView {

    /// <#Description#>
    public var style: AppearanceStyleView.Type {
        get { return object_getClass(self) as! AppearanceStyleView.Type }
        set { _setStyle(newValue) }
    }
    
    /// <#Description#>
    ///
    /// - Parameter type: <#type description#>
    private func _setStyle(_ type: AppearanceStyleView.Type) {
        object_setClass(self, type)
        window?.refreshAppearance()
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - type: <#type description#>
    ///   - duration: <#duration description#>
    public func setStyle(_ type: AppearanceStyleView.Type, duration: TimeInterval) {
        object_setClass(self, type)
        window?.refreshAppearance(duration: duration)
    }
}
