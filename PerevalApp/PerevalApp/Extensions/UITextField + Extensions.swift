import UIKit

extension UITextField {
    func setHorizontalInsets(_ amount: CGFloat) {
        setLeftTextInset(amount)
        setRightTextInset(amount)
    }
    
    private func setLeftTextInset(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: amount,
                                               height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    private func setRightTextInset(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: amount,
                                               height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
