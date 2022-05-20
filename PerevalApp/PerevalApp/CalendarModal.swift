import UIKit

class CalendarModal {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private var mainView: UIView?
    private let dateTextField = UITextField()
    
    var buttonAction: ( (String, String) -> Void)?
    
    func alertCustom(viewController: UIViewController, repsOrTimer: String, completion: @escaping (String, String) -> Void) {
        
        registerForKeyboardNotification()
        
        guard let parentView = viewController.view else { return }
        mainView = parentView
        
        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)
        
        backgroundView.frame = parentView.frame
        scrollView.addSubview(backgroundView)
        
        modalView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parentView.frame.width - 80,
                                 height: 420)
        scrollView.addSubview(modalView)
        
        let editingLabel = UILabel(frame: CGRect(x: 10,
                                                 y: modalView.frame.height * 0.4 + 50,
                                                 width: modalView.frame.width - 20,
                                                 height: 25))
        editingLabel.text = "Editing"
        editingLabel.textAlignment = .center
//        editingLabel.font = .robotoMedium22()
        modalView.addSubview(editingLabel)
        
        let setsLabel = UILabel(text: "Custom Date and Time")
        setsLabel.translatesAutoresizingMaskIntoConstraints = true
        setsLabel.frame = CGRect(x: 30,
                                 y: editingLabel.frame.maxY + 10,
                                 width: modalView.frame.width - 60,
                                 height: 20)
        modalView.addSubview(setsLabel)
        
        dateTextField.frame = CGRect(x: 20,
                                     y: setsLabel.frame.maxY,
                                     width: modalView.frame.width - 40,
                                     height: 30)
        dateTextField.backgroundColor = .brown
        dateTextField.borderStyle = .none
        dateTextField.layer.cornerRadius = 10
        dateTextField.textColor = .specialGray
//        dateTextField.font = .robotoBold20()
        dateTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: dateTextField.frame.height))
        dateTextField.leftViewMode = .always
        dateTextField.clearButtonMode = .always
        dateTextField.returnKeyType = .done
        dateTextField.keyboardType = .numberPad
        modalView.addSubview(dateTextField)
        
        let okButton = UIButton(frame: CGRect(x: 50,
                                              y: dateTextField.frame.maxY + 15,
                                              width: modalView.frame.width - 100,
                                              height: 35))
        okButton.backgroundColor = .systemPurple
        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.textColor = .white
//        okButton.titleLabel?.font = .robotoMedium18()
        okButton.layer.cornerRadius = 10
        okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        modalView.addSubview(okButton)
        
        buttonAction = completion
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.modalView.center = parentView.center
                }
            }
        }
    }
    
    @objc private func dismissAlert() {

        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.modalView.frame = CGRect(x: 40, y: targetView.frame.height, width: targetView.frame.width - 80, height: 420)
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.backgroundView.alpha = 0
                    // TODO: need to reado ARC - Automatic Reference Counting and why do we need weak self here
                } completion: { [weak self] done in
                    guard let self = self else { return }
                    if done {
                        self.modalView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.scrollView.removeFromSuperview()
                        self.removeForKeyboardNotification()
                        self.dateTextField.text = ""
                    }
                }
            }
        }
    }
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbWillShow() {
        scrollView.contentOffset = CGPoint(x: 0, y: 100)
    }
    
    @objc private func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
}

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
//        self.font = .robotoMedium14()
//        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
