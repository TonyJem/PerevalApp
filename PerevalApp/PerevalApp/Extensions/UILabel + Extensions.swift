import UIKit

extension UILabel {
    func add(header: String,
             stringList: [String],
             font: UIFont,
             bullet: String = "\u{2022}",
             indentation: CGFloat = 15,
             lineSpacing: CGFloat = 2,
             paragraphSpacing: CGFloat = 0,
             textColor: UIColor = .gray,
             bulletColor: UIColor = .red) -> NSAttributedString {
        
        guard !stringList.isEmpty else {
            return NSMutableAttributedString(string: "")
        }
        
        let bulletList = NSMutableAttributedString()
        
        bulletList.append(NSMutableAttributedString(string: "\(header)\n"))
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font,
                                                             NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font,
                                                               NSAttributedString.Key.foregroundColor: bulletColor]
        let nonOptions = [NSTextTab.OptionKey: Any]()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        //paragraphStyle.firstLineHeadIndent = 0
        //paragraphStyle.headIndent = 20
        //paragraphStyle.tailIndent = 1
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        
        for string in stringList {
            let formattedString = "\t\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string = NSString(string: formattedString)
            let rangeForBullet = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        
        return bulletList
    }
}
