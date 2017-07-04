//
//  AppBackgroundView.swift
//  SwiftyAppearance
//
//  Created by Victor Pavlychko on 9/26/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit
import SwiftyAppearance

final class AppBackgroundView: UIView, AppearanceStyleable {

    enum Style: String {
        case `default`
        case alternate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style = .default
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        style = .default
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
    }
}
