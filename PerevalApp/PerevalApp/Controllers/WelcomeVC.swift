import UIKit

class WelcomeVC: UIViewController {
    
    // MARK: - Views
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "adventure")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let topTagLabel: UILabel = {
        let label = UILabel()
        let text = "#ПОХОДЫ #СВОБОДА"
        label.text = text.uppercased()
        label.font = .dinProMedium24()
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomTagLabel: UILabel = {
        let label = UILabel()
        let text = "#ПРЕОДОЛЕНИЯ #ОТКРЫТИЯ"
        label.text = text.uppercased()
        label.font = .dinProMedium24()
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let text = "Опиши перевал"
        label.text = text.uppercased()
        label.font = .ptSansBold40()
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        let text = "Наполняем каталог перевалов вместе"
        label.text = text
        label.font = .ptSans18()
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .black
        button.titleLabel?.font = .ptSans22()
        button.setTitle("Войти".uppercased(), for: .normal)
        
        button.backgroundColor = .white
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBackground
        
        setupViews()
        setConstraints()
        
        /// print All Font names:
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
    }
    
    override func viewDidLayoutSubviews() {
        enterButton.layer.cornerRadius = enterButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapEnterButton() {
        let registrationVC = RegistrationVC()
        registrationVC.modalPresentationStyle = .fullScreen
        present(registrationVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(heroImageView)
        view.addSubview(topTagLabel)
        view.addSubview(bottomTagLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(enterButton)
    }
}

// MARK: - SetConstraints
extension WelcomeVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 161 * 1.2),
            logoImageView.heightAnchor.constraint(equalToConstant: 97 * 1.2)
        ])
        
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heroImageView.widthAnchor.constraint(equalToConstant: 246 * 1.15),
            heroImageView.heightAnchor.constraint(equalToConstant: 191 * 1.15)
        ])
        
        NSLayoutConstraint.activate([
            topTagLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topTagLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 37),
            topTagLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topTagLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bottomTagLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bottomTagLabel.topAnchor.constraint(equalTo: topTagLabel.bottomAnchor, constant: 6),
            bottomTagLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            bottomTagLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: bottomTagLabel.bottomAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 300),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
