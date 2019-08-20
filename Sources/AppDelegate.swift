//
//  AppDelegate
//  Language Switch Demo
//
//  Created by Alex Babaev on 2019-08-20.
//  Copyright © 2019 Redmadrobot. All rights reserved.
//

import UIKit

extension NSMutableParagraphStyle {
    convenience init(setup: (NSMutableParagraphStyle) -> Void) {
        self.init()
        setup(self)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = navigationController

        let localization = Localization()
        localization.inject()
        localization.language = .english

        window?.makeKeyAndVisible()

        return true
    }
}
