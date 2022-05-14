import UIKit

extension UIFont {
    
    //label.font = UIFont(name: "PTSans-Regular", size: 16)

    //MARK: - Regular
    static func ptSans18() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 18)
    }
    
    static func ptSans22() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 22)
    }
    
    //MARK: - Medium
    static func dinProMedium24() -> UIFont? {
        return UIFont.init(name: "DINPro-Medium", size: 24)
    }
    
    //MARK: - Bold
    static func ptSansBold40() -> UIFont? {
        return UIFont.init(name: "PTSans-Bold", size: 40)
    }
}
