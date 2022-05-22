import UIKit

class CoordinatesModal {
    
    // MARK: - Views
    
    private var mainView: UIView?
    
    private let scrollView = UIScrollView()
    
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
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .coordinatesGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconView: UIImageView = {
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
    
    private lazy var gpsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .mainBlue
        button.titleLabel?.font = .ptSans16()
        button.setTitle("ОПРЕДЕЛИТЬ С GPS", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapGpsButton), for: .touchUpInside)
        return button
    }()
    
    private let latitudeField = CoordinateField(type: .latitude)
    private let longitudeField = CoordinateField(type: .longitude)
    private let altitudeField = AltitudeField()
    
    private lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.titleLabel?.font = .ptSans18()
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .mainBlue
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    @objc private func didTapGpsButton() {
        print("🟢 didTapGpsButton in Coordinates!")
    }
    
    @objc private func dismissModal() {
        guard let targetView = mainView else { return }
        
//        let coordinates = getCoordinates()
        
        UIView.animate(withDuration: 0.3) {
            self.modalView.frame = CGRect(x: 40,
                                          y: targetView.frame.height,
                                          width: targetView.frame.width - 60,
                                          height: 420)
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.backgroundView.alpha = 0
                } completion: { [weak self] done in
                    guard let self = self else { return }
                    if done {
                        self.modalView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.scrollView.removeFromSuperview()
                        self.removeForKeyboardNotification()
                        print("🟢🟢🟢🟢 dismiss CoordinatesModal - ok")
                    }
                }
            }
        }
    }
    
    // MARK: - Public Methods
    func show(in viewController: UIViewController, with coordinates: Coords) {
        
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
        
        setupViews()
        setConstraints()
        setCoordinates(with: coordinates)
        registerForKeyboardNotification()
        presentModalWithAnimation(in: parentView)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        modalView.addSubview(separatorView)
        modalView.addSubview(iconView)
        modalView.addSubview(titleLabel)
        modalView.addSubview(gpsButton)
        modalView.addSubview(latitudeField)
        modalView.addSubview(longitudeField)
        modalView.addSubview(altitudeField)
        modalView.addSubview(okButton)
    }
    
    private func presentModalWithAnimation(in parent: UIView) {
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.modalView.center = parent.center
                }
            }
        }
    }
    
    private func setCoordinates(with coordinates: Coords) {
        latitudeField.setInitialText(coordinates.latitude)
        longitudeField.setInitialText(coordinates.longitude)
        altitudeField.setInitialText(coordinates.height)
    }
    
    private func getCoordinates() -> Coords {
        
        let latitude = latitudeField.getCoordinate()
        let longitude = longitudeField.getCoordinate()
        let height = altitudeField.getHeight()
        
        let coordinates = Coords(latitude: latitude,
                                 longitude: longitude,
                                 height: height)
        return coordinates
    }
}

// MARK: - Handle Keyboard Show and Hide
extension CoordinatesModal {
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
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

// MARK: - SetConstraints
extension CoordinatesModal {
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
            titleLabel.trailingAnchor.constraint(equalTo: gpsButton.leadingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            gpsButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            gpsButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -25),
            gpsButton.widthAnchor.constraint(lessThanOrEqualToConstant: 180),
            gpsButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            latitudeField.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            latitudeField.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            latitudeField.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            latitudeField.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            longitudeField.topAnchor.constraint(equalTo: latitudeField.bottomAnchor),
            longitudeField.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            longitudeField.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            longitudeField.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            altitudeField.topAnchor.constraint(equalTo: longitudeField.bottomAnchor),
            altitudeField.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 50),
            altitudeField.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -50),
            altitudeField.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -20),
            okButton.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 70),
            okButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -70),
            okButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
