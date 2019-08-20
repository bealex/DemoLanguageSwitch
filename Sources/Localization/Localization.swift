//
// Localization
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

import UIKit

class Localization {
    enum Language {
        case english
        case arabic

        var identifier: String {
            switch self {
                case .english: return "en"
                case .arabic: return "ar"
            }
        }

        var semanticAttribute: UISemanticContentAttribute {
            switch self {
                case .english: return .forceLeftToRight
                case .arabic: return .forceRightToLeft
            }
        }
    }

    var language: Language {
        didSet { update() }
    }
    private var currentBundle: Bundle

    init() {
        language = .english
        currentBundle = Bundle.main
    }

    func inject() {
        UIApplication.shared
            .windows
            .compactMap { $0.rootViewController }
            .compactMap { $0 as? Localizable }
            .forEach { $0.localization = self }
    }

    func string(_ key: String) -> String {
        return currentBundle.localizedString(forKey: key, value: key, table: nil)
    }

    func update() {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: language.identifier, ofType: "lproj")
        if let path = path, let updatedBundle = Bundle(path: path) {
            currentBundle = updatedBundle
        } else {
            currentBundle = bundle
        }

        localize()
    }

    func localize() {
        UIApplication.shared
            .windows
            .compactMap { $0.rootViewController }
            .compactMap { $0 as? Localizable }
            .forEach { $0.localize() }

        if let window = UIApplication.shared.delegate?.window as? UIWindow {
            let rootViewController = window.rootViewController
            window.rootViewController = nil
            window.rootViewController = rootViewController
        }
    }
}
