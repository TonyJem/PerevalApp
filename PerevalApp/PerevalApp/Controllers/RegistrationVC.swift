import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - Properties
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // MARK: - Views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentSize
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Давайте знакомиться"
        label.font = .ptSans32()
        label.textColor = .mainBlue
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bulletLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .montserratLight19()
        
        let arrayString = [
            "Запишем вас:",
            "в список помогавших наполнять базу перевалов",
            "в качестве первопроходителей перевала, если он новый",
            "в базу туристов ФСТР"
        ]
        
        label.attributedText = label.add(stringList: arrayString,
                                         font: label.font,
                                         textColor: .brownGray,
                                         bulletColor: .brownGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        
        let inputFieldTypes: [InputFieldType] = [.surname,
                                                 .name,
                                                 .patronymic,
                                                 .email,
                                                 .phone,
                                                 .mediaLink ]
        for inputFieldType in inputFieldTypes {
            let inputView = InputField()
            inputView.type = inputFieldType
            inputView.setTitle(inputFieldType.title)
            inputView.update(inputFieldType.userSettingsText)
            stackView.addArrangedSubview(inputView)
        }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptSans22()
        button.setTitle("Войти", for: .normal)
        
        button.backgroundColor = .dimedBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
        return button
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = .ptSans12()
        label.textColor = .darkBlue
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.text = "Используя приложение, вы даёте согласие ФСТР\nна обработку персональных данных"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        setupDelegates()
        
        registerForKeyboardNotifications()
        initializeHideKeyboard()
    }
    
    override func viewDidLayoutSubviews() {
        enterButton.layer.cornerRadius = enterButton.frame.height / 2
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    // MARK: - Actions
    @objc private func didTapEnterButton() {
        UserSettings.saveUser()
        SceneDelegate.shared.rootViewController.switchToMountainPassListScreen()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topLabel)
        contentView.addSubview(bulletLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(enterButton)
        contentView.addSubview(bottomLabel)
    }
    
    private func setupDelegates() {
        for view in stackView.arrangedSubviews {
            if let inputField = view as? InputField {
                inputField.delegate = self
            }
        }
    }
}

// MARK: - SetConstraints
extension RegistrationVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            topLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            topLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bulletLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 15),
            bulletLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            bulletLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            bulletLabel.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: bulletLabel.bottomAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: enterButton.topAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            enterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            enterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            enterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 5),
            bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            bottomLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            bottomLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}

// MARK: - Handle Keyboard Show and Hide
extension RegistrationVC {
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let visibleSize = CGSize(width: view.frame.width, height: view.frame.height - keyboardSize.height)
            scrollView.frame.size = visibleSize
        }
    }
    
    @objc private func keyboardWillHide() {
        let visibleSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.frame.size = visibleSize
    }
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

extension RegistrationVC: InputFieldDelegate {
    
    func inputFieldDidEndEditing(_ type: InputFieldType, text: String?) {
        switch type {
        case .surname:
            UserSettings.userSurname = text
        case .name:
            UserSettings.userName = text
        case .patronymic:
            UserSettings.userPatronymic = text
        case .email:
            UserSettings.userEmail = text
        case .phone:
            UserSettings.userPhone = text
        case .mediaLink:
            UserSettings.userMediaLink = text
        }
    }
}
