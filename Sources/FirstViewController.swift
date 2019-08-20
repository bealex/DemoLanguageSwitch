//
//  FirstViewController
//  Language Switch Demo
//
//  Created by Alex Babaev on 2019-08-20.
//  Copyright © 2019 Redmadrobot. All rights reserved.
//

import UIKit

class FirstViewController: ViewController {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var titleAttributed: UILabel!
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var pushButton: UIButton!
    @IBOutlet private var languageSwitch: UISwitch!
    @IBOutlet private var languageEnglishLabel: UILabel!
    @IBOutlet private var languageArabicLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        localize()
    }

    override func localize() {
        super.localize()

        titleLabel.text = localization.string("title")
        titleAttributed.attributedText = NSAttributedString(
            string: localization.string("titleAttributed"),
            attributes: [
                .font: UIFont.systemFont(ofSize: 20),
                .foregroundColor: UIColor.blue,
                .paragraphStyle: NSMutableParagraphStyle {
                    $0.lineBreakMode = .byTruncatingTail
                }
            ]
        )
        textView.text = localization.string("text")
        pushButton.setTitle(localization.string("button"), for: .normal)
        languageEnglishLabel.text = localization.string("language.english")
        languageArabicLabel.text = localization.string("language.arabic")

        languageSwitch.setOn(localization.language == .english, animated: false)
    }

    @IBAction
    private func switchTap() {
        localization.language = languageSwitch.isOn ? .english : .arabic
    }
}
