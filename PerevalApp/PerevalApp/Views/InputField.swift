import UIKit

class InputField: UIView {
    
    // MARK: - Views
    private let textField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .green
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        backgroundColor = .systemPink
//        layer.cornerRadius = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textField)
    }
}

// MARK: - SetConstraints
extension InputField {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
