//
//  AppDelegate.swift
//
//  Created by AhmedFitoh on 6/2/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setOnboardingScreen()
        return true
    }

    private func setOnboardingScreen(){
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let universityListWireframe = UniversityListScreenWireframe()
        window.rootViewController =  UINavigationController(rootViewController:
                                                                universityListWireframe.buildModule())
        window.makeKeyAndVisible()
    }
}
