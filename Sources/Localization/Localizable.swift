//
// Localizable
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

protocol Localizable: class {
    var localization: Localization! { get set }
    func localize()
}
