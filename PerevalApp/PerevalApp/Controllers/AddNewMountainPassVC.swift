import UIKit

class AddNewMountainPassVC: UIViewController {
    
    // MARK: - Views
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.setHorizontalInsets(10)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Название перевала"
        textField.font = .ptSans18()
        textField.layer.borderColor = UIColor.borderGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptMonoBold()
        button.setTitle("i", for: .normal)
        
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
        return button
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .systemGray6
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Категория перевала"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .darkBlue
        button.titleLabel?.font = .ptSans18()
        button.setTitle("Н/К", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.mainBlue.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
        button.addTarget(self, action: #selector(didTapCategoryButton), for: .touchUpInside)
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
        infoButton.layer.cornerRadius = infoButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapInfoButton() {
        print("🟢 didTapInfoButton in AddNewMountainPassVC")
    }
    
    @objc private func didTapCategoryButton() {
        print("🟢 didTapCategoryButton in AddNewMountainPassVC")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(textField)
        view.addSubview(infoButton)
        view.addSubview(categoryLabel)
        view.addSubview(categoryButton)
    }
}

// MARK: - SetConstraints
extension AddNewMountainPassVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalTo: infoButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: infoButton.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            categoryLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: 0),
            categoryLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 25),
            categoryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            categoryButton.widthAnchor.constraint(equalToConstant: 65),
            categoryButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
