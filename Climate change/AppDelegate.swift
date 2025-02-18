//
//  AppDelegate.swift
//  Climate change
//
//  Created by Emmanuel Pena on 2/14/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            let viewController = ViewController() // Replace with your initial VC
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
            return true
        }
    }


    // MARK: UISceneSession Lifecycle

    


