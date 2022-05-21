import UIKit

class Coordinates {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private var mainView: UIView?
    private let setsTextField = UITextField()
    private let repsTextField = UITextField()
    
    var buttonAction: ( (String, String) -> Void)?
    
    func showCoordinatesModal(viewController: UIViewController,
                              repsOrTimer: String,
                              completion: @escaping (String, String) -> Void) {
        
        registerForKeyboardNotification()
        
        guard let parentView = viewController.view else { return }
        mainView = parentView
        
        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)
        
        backgroundView.frame = parentView.frame
        scrollView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parentView.frame.width - 80,
                                 height: 420)
        scrollView.addSubview(alertView)
        
        let editingLabel = UILabel(frame: CGRect(x: 10,
                                                 y: alertView.frame.height * 0.4 + 50,
                                                 width: alertView.frame.width - 20,
                                                 height: 25))
        editingLabel.text = "Editing"
        editingLabel.textAlignment = .center
//        editingLabel.font = .robotoMedium22()
        alertView.addSubview(editingLabel)
        
        let setsLabel = UILabel()
        setsLabel.text = "Sets"
        
        setsLabel.translatesAutoresizingMaskIntoConstraints = true
        setsLabel.frame = CGRect(x: 30,
                                 y: editingLabel.frame.maxY + 10,
                                 width: alertView.frame.width - 60,
                                 height: 20)
        alertView.addSubview(setsLabel)
        
        setsTextField.frame = CGRect(x: 20,
                                     y: setsLabel.frame.maxY,
                                     width: alertView.frame.width - 40,
                                     height: 30)
        setsTextField.backgroundColor = .brown
        setsTextField.borderStyle = .none
        setsTextField.layer.cornerRadius = 10
        setsTextField.textColor = .specialGray
//        setsTextField.font = .robotoBold20()
        setsTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: setsTextField.frame.height))
        setsTextField.leftViewMode = .always
        setsTextField.clearButtonMode = .always
        setsTextField.returnKeyType = .done
        setsTextField.keyboardType = .numberPad
        alertView.addSubview(setsTextField)
        
        let repsOrTimerLabel = UILabel()
        repsOrTimerLabel.text = "repsOrTimer"
        repsOrTimerLabel.translatesAutoresizingMaskIntoConstraints = true
        repsOrTimerLabel.frame = CGRect(x: 30,
                                 y: setsTextField.frame.maxY + 3,
                                 width: alertView.frame.width - 60,
                                 height: 20)
        alertView.addSubview(repsOrTimerLabel)
        
        repsTextField.frame = CGRect(x: 20,
                                     y: repsOrTimerLabel.frame.maxY,
                                     width: alertView.frame.width - 40,
                                     height: 30)
        repsTextField.backgroundColor = .brown
        repsTextField.borderStyle = .none
        repsTextField.layer.cornerRadius = 10
        repsTextField.textColor = .specialGray
//        repsTextField.font = .robotoBold20()
        repsTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: repsTextField.frame.height))
        repsTextField.leftViewMode = .always
        repsTextField.clearButtonMode = .always
        repsTextField.returnKeyType = .done
        repsTextField.keyboardType = .numberPad
        alertView.addSubview(repsTextField)
        
        let okButton = UIButton(frame: CGRect(x: 50,
                                              y: repsTextField.frame.maxY + 15,
                                              width: alertView.frame.width - 100,
                                              height: 35))
        okButton.backgroundColor = .green
        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.textColor = .white
//        okButton.titleLabel?.font = .robotoMedium18()
        okButton.layer.cornerRadius = 10
        okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(okButton)
        
        buttonAction = completion
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = parentView.center
                }
            }
        }
    }
    
    @objc private func dismissAlert() {
        guard let setsNumber = setsTextField.text else { return }
        guard let repsNumber = repsTextField.text else { return }
        buttonAction?(setsNumber, repsNumber)
        
        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40, y: targetView.frame.height, width: targetView.frame.width - 80, height: 420)
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.backgroundView.alpha = 0
                    // TODO: need to reado ARC - Automatic Reference Counting and why do we need weak self here
                } completion: { [weak self] done in
                    guard let self = self else { return }
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.scrollView.removeFromSuperview()
                        self.removeForKeyboardNotification()
                        self.setsTextField.text = ""
                        self.repsTextField.text = ""
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
