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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(textField)
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
        
    }
}
