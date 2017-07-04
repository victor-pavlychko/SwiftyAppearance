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
        guard let view = view as? AppBackgroundView else {
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            view.setStyle(.default, animated: true)
        default:
            view.setStyle(.alternate, animated: true)
        }
    }
    
}
