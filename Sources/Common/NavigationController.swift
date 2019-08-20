//
// NavigationController
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, Localizable {
    var localization: Localization! {
        didSet {
            viewControllers
                .compactMap { $0 as? Localizable }
                .forEach { $0.localization = localization }
        }
    }

    func localize() {
        navigationBar.localize(localization.language.semanticAttribute)
        view.localize(localization.language.semanticAttribute, recursive: false)
        viewControllers
            .compactMap { $0 as? Localizable }
            .forEach { $0.localize() }
    }
}
