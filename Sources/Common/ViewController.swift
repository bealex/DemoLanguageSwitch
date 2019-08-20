//
// ViewController
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, Localizable {
    var localization: Localization!

    func localize() {
        view.localize(localization.language.semanticAttribute)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let localizable = (segue.destination as? Localizable) {
            localizable.localization = localization
        }
    }
}
