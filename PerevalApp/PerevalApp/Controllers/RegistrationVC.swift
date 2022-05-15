import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - Views
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
        label.font = .MontserratLight18()
        
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
        
        let titles = ["Фамилия",
                      "Имя",
                      "Отчество",
                      "E-mail будет логином и основным средством связи с вами",
                      "По желанию",
                      "По желанию"]
        
        for title in titles {
            let inputView = InputField()
            inputView.setTitle(title)
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
    }
    
    override func viewDidLayoutSubviews() {
        enterButton.layer.cornerRadius = enterButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapEnterButton() {
        print("🟢 didTapEnterButton in RegistrationVC")
        
        let mountainPassListVC = MountainPassListVC()
        mountainPassListVC.modalPresentationStyle = .fullScreen
        present(mountainPassListVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(topLabel)
        view.addSubview(bulletLabel)
        view.addSubview(stackView)
        view.addSubview(enterButton)
        view.addSubview(bottomLabel)
    }
}

// MARK: - SetConstraints
extension RegistrationVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            topLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bulletLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 15),
            bulletLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            bulletLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            bulletLabel.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: bulletLabel.bottomAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackView.bottomAnchor.constraint(equalTo: enterButton.topAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            enterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 5),
            bottomLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            bottomLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            bottomLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
