//
//  AppDelegate.swift
//  SwiftyAppearanceDemo
//
//  Created by Victor Pavlychko on 9/19/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import UIKit
import SwiftyAppearance

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        appearance { }
        appearance(for: UITraitCollection()) { }
        appearance(for: UITraitCollection(), in: [UIView.self]) { }
        appearance(for: UITraitCollection(), inAny: [UIView.self]) { }
        appearance(in: [UIView.self]) { }
        appearance(inAny: [UIView.self]) { }

        UIViewController.appearance { }
        UIViewController.appearance(for: UITraitCollection()) { }

        UIBarItem.appearance { _ in }
        UIBarItem.appearance(for: UITraitCollection()) { _ in }

        UIView.appearance { }
        UIView.appearance(for: UITraitCollection()) { }

        UIView.appearance { _ in }
        UIView.appearance(for: UITraitCollection()) { _ in }

        AppTabBarController.appearance {
            UITabBar.appearance {
                $0.barStyle = .black
                $0.barTintColor = UIColor(rgb: 0x2c3e50)
                $0.tintColor = UIColor(rgb: 0xecf0f1)
            }
            UIView.appearance {
                FirstNavigationController.appearance {
                    UINavigationBar.appearance {
                        $0.barStyle = .black
                        $0.barTintColor = UIColor(rgb: 0x2980b9)
                        $0.tintColor = UIColor(rgb: 0xecf0f1)
                    }
                    UIView.appearance {
                        FirstViewController.appearance {
                            AppBackgroundView.appearance(style: .default) {
                                $0.backgroundColor = UIColor(rgb: 0xecf0f1)
                                $0.tintColor = UIColor(rgb: 0x34495e)
                                UILabel.appearance {
                                    $0.textColor = UIColor(rgb: 0x2c3e50)
                                }
                            }
                            AppBackgroundView.appearance(style: .alternate) {
                                $0.backgroundColor = UIColor(rgb: 0xf1c40f)
                                $0.tintColor = UIColor(rgb: 0x34495e)
                                UILabel.appearance {
                                    $0.textColor = UIColor(rgb: 0xe67e22)
                                }
                            }
                        }
                    }
                }
                SecondNavigationController.appearance {
                    UINavigationBar.appearance {
                        $0.barStyle = .default
                        $0.barTintColor = UIColor(rgb: 0xf39c12)
                        $0.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(rgb: 0xc0392b)]
                    }
                    UIView.appearance {
                        SecondViewController.appearance {
                            AppBackgroundView.appearance {
                                $0.backgroundColor = UIColor(rgb: 0xf1c40f)
                                UILabel.appearance {
                                    $0.textColor = UIColor(rgb: 0xe67e22)
                                }
                            }
                        }
                    }
                }
            }
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

