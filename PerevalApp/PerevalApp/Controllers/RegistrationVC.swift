import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - Views
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        
        let title = "Войти"
        button.setTitle(title, for: .normal)
        
        button.backgroundColor = .blue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        setupViews()
        setConstraints()
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
        view.addSubview(enterButton)
    }
}

// MARK: - SetConstraints
extension RegistrationVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
