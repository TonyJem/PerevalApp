import UIKit

extension UIButton {
    func underline() {
        guard let tittleText = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: (tittleText))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0,
                                                     length: (tittleText.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
