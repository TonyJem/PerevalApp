import UIKit

class InputField: UIView {
    
    var type: InputFieldType?
    
    // MARK: - Views
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.specialGray.cgColor
        textField.setHorizontalInsets(10)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .ptSans11()
        label.textColor = .specialGray
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textField)
        addSubview(descriptionLabel)
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        descriptionLabel.text = title
    }
}

// MARK: - SetConstraints
extension InputField {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
