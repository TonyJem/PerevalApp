import UIKit

class RegistrationVC: UIViewController {
    
    // MARK: - Views
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = "Давайте знакомиться"
        label.text = text
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
    }
}

// MARK: - SetConstraints
extension RegistrationVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        NSLayoutConstraint.activate([
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
