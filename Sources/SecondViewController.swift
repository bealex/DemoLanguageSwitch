//
// SecondViewController
// Language Switch Demo
//
// Created by Alex Babaev on 20 August 2019.
// Copyright (c) 2019 Redmadrobot. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: ViewController {
    @IBOutlet private var titleAttributed: UILabel!
    @IBOutlet private var titleAttributed2: UILabel!

    @IBOutlet private var languageSwitch: UISwitch!
    @IBOutlet private var languageEnglishLabel: UILabel!
    @IBOutlet private var languageArabicLabel: UILabel!

    @IBOutlet private var languageSwitch2: UISwitch!
    @IBOutlet private var languageEnglishLabel2: UILabel!
    @IBOutlet private var languageArabicLabel2: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        localize()
    }

    override func localize() {
        [ titleAttributed, titleAttributed2 ].forEach {
            $0.attributedText = NSAttributedString(
                string: $0.text ?? "—",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 20),
                    .foregroundColor: UIColor.blue,
                    .paragraphStyle: NSMutableParagraphStyle {
                        $0.lineBreakMode = .byTruncatingTail
                    }
                ]
            )
        }

        languageEnglishLabel.text = localization.string("language.english")
        languageEnglishLabel2.text = localization.string("language.english")
        languageArabicLabel.text = localization.string("language.arabic")
        languageArabicLabel2.text = localization.string("language.arabic")

        languageSwitch.setOn(localization.language == .english, animated: false)
        languageSwitch2.setOn(localization.language == .english, animated: false)

        super.localize()
    }

    @IBAction
    private func switchTap() {
        localization.language = languageSwitch.isOn ? .english : .arabic
    }
}
