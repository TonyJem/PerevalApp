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
        label.font = .ptSans16()
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
