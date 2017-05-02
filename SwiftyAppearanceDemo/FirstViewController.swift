//
//  FirstViewController.swift
//  SwiftyAppearanceDemo
//
//  Created by Victor Pavlychko on 9/19/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit
import SwiftyAppearance

class FirstViewController: AppViewController {
    
    @IBAction func changeAppearance(sender: UISegmentedControl) {
        guard let view = view as? AppearanceView else {
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            view.setStyle(AppBackgroundView.self, duration: 0.25)
        default:
            view.setStyle(AlternateBackgroundView.self, duration: 0.25)
        }
    }
    
}
