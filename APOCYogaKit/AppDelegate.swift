//
//  AppDelegate.swift
//  APOCYogaKit
//
//  Created by Alejandro  Rodriguez on 1/23/19.
//  Copyright © 2019 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = InitController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}

