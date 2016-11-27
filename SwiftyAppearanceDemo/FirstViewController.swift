//
//  FirstViewController.swift
//  SwiftyAppearanceDemo
//
//  Created by Victor Pavlychko on 9/19/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit

class FirstViewController: AppViewController {
    
    @IBAction func changeAppearance(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            FirstNavigationController.appearance {
                UINavigationBar.appearance {
                    $0.barStyle = .black
                    $0.barTintColor = UIColor(rgb: 0x2980b9)
                    $0.tintColor = UIColor(rgb: 0xecf0f1)
                }
            }
        default:
            FirstNavigationController.appearance {
                UINavigationBar.appearance {
                    $0.barStyle = .black
                    $0.barTintColor = UIColor(rgb: 0xc0392b)
                    $0.tintColor = UIColor(rgb: 0xecf0f1)
                }
            }
        }

        UIApplication.shared.refreshAppearance()
    }
    
}
