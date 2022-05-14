import UIKit

extension UIFont {
    
    //label.font = UIFont(name: "PTSans-Regular", size: 16)

    //MARK: - Regular
    
    static func ptSans16() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 12)
    }
    
    static func ptSans18() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 18)
    }
    
    static func ptSans22() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 22)
    }
    
    static func ptSans32() -> UIFont? {
        return UIFont.init(name: "PTSans-Regular", size: 32)
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
