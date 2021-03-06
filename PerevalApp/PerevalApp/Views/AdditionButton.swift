import UIKit

protocol AdditionButtonDelegate: AnyObject {
    func didTapAdditionButton(with title: String, status: Bool)
}

class AdditionButton: UIView {
    
    var isActive = false {
        didSet {
            customButton.backgroundColor = isActive ? .mainBlue : .white
            customButton.tintColor = isActive ? .white : .darkBlue
        }
    }
    
    weak var delegate: AdditionButtonDelegate?
    
    // MARK: - Views
    
    private lazy var customButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .ptSans18()
        button.setTitle("", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.mainBlue.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
        button.addTarget(self, action: #selector(didTapCustomButton), for: .touchUpInside)
        return button
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = .ptSans11()
        label.textColor = .darkBlue
        label.textAlignment = .left
//        label.backgroundColor = .green
        
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
        isActive = false
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(customButton)
        addSubview(descriptionLabel)
    }
    
    // MARK: - Actions
    @objc private func didTapCustomButton() {
        print("???? didTapCustomButton in AdditionButton class!")
        
        guard let buttonTitle = customButton.titleLabel?.text else { return }
        delegate?.didTapAdditionButton(with: buttonTitle, status: isActive)
    }
    
    // MARK: - Public Methods
    func setLabelTitle(_ title: String) {
        descriptionLabel.text = title
    }
    
    func setButtonTitle(_ title: String) {
        customButton.setTitle(title, for: .normal)
    }
    
    func getButtonTitle() -> String {
        guard let buttonTitle = customButton.titleLabel?.text else { return "" }
        return buttonTitle
    }
}

// MARK: - SetConstraints
extension AdditionButton {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            customButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 100),
            customButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: customButton.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: customButton.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 130)
        ])
    }
}
