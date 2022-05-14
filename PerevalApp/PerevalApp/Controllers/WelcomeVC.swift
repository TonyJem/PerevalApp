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
    
    private let tagContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        
        let text = "Опиши перевал"
        label.text = text.uppercased()
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        
        let text = "Наполняем каталог перевалов вместе!"
        label.text = text
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        
        let text = "Добавь название, фото и координаты"
        label.text = text
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        
        let title = "Войти"
        button.setTitle(title.uppercased(), for: .normal)
        
        button.backgroundColor = .systemPink

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
    }
    
    // MARK: - Actions
    @objc private func didTapEnterButton() {
        print("🟢 didTapEnterButton in WelcomeVC")
        
        let registrationVC = RegistrationVC()
        registrationVC.modalPresentationStyle = .fullScreen
        present(registrationVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(tagContainer)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonLabel)
        view.addSubview(enterButton)
    }
}

// MARK: - SetConstraints
extension WelcomeVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 161 * 1.5),
            logoImageView.heightAnchor.constraint(equalToConstant: 97 * 1.5)
        ])
        
        NSLayoutConstraint.activate([
            tagContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tagContainer.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            tagContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tagContainer.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: tagContainer.bottomAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            buttonLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            buttonLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterButton.topAnchor.constraint(equalTo: buttonLabel.bottomAnchor, constant: 20),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
