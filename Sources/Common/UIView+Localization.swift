//
// UIView
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

import UIKit

extension UIView {
    func localize(_ semantic: UISemanticContentAttribute, recursive: Bool = true) {
        if recursive {
            subviews.forEach { $0.localize(semantic) }
        }

        guard semanticContentAttribute != .playback, semanticContentAttribute != .spatial else { return }

        if semanticContentAttribute != semantic {
            semanticContentAttribute = semantic
        }

        let nonChangeable: [NSTextAlignment] = [ .justified, .center ]
        let alignment: NSTextAlignment = semantic == .forceRightToLeft ? .right : .left

        switch (self, semanticContentAttribute) {
            case (let view as UITextField, _) where !nonChangeable.contains(view.textAlignment):
                if view.textAlignment != alignment {
                    view.textAlignment = alignment
                }
            case (let view as UITextView, _) where !nonChangeable.contains(view.textAlignment):
                if view.textAlignment != alignment {
                    view.textAlignment = alignment
                }
            default:
                break
        }
    }
}
