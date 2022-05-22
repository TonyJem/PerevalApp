import UIKit

// MARK: - SetConstraints
extension Coordinates {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 58),
            separatorView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 25),
            iconView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 25),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: iconView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            latitudeView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            latitudeView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            latitudeView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            latitudeView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            longitudeView.topAnchor.constraint(equalTo: latitudeView.bottomAnchor),
            longitudeView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            longitudeView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            longitudeView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            altitudeField.topAnchor.constraint(equalTo: longitudeView.bottomAnchor),
            altitudeField.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            altitudeField.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            altitudeField.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

class Coordinates {
    
    // MARK: - Views
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .coordinatesGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = UIImage(named: "coordinates")
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Координаты"
        label.font = .ptSans18()
        label.textColor = .darkGray
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let latitudeView = LatitudeView()
    private let longitudeView = LongitudeView()
    private let altitudeField = AltitudeField()
    
    // MARK: - Private Methods
    private func setupViews() {
        modalView.addSubview(separatorView)
        modalView.addSubview(iconView)
        modalView.addSubview(titleLabel)
        modalView.addSubview(latitudeView)
        modalView.addSubview(longitudeView)
        modalView.addSubview(altitudeField)
    }
    
    
    
    
    // MARK: - OLD code below -
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private var mainView: UIView?


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
        
        modalView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parentView.frame.width - 60,
                                 height: parentView.frame.width - 60)
        scrollView.addSubview(modalView)
        
        
        let okButton = UIButton(frame: CGRect(x: 50,
                                              y: 300,
                                              width: modalView.frame.width - 100,
                                              height: 35))
        okButton.backgroundColor = .green
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
        
        setupViews()
        setConstraints()
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
