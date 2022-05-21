import UIKit

protocol CategoryButtonDelegate: AnyObject {
    func didTapCategoryButton(with title: String)
}

class CategoryButton: UIButton {
    
    var isActive = false {
        didSet {
            customButton.backgroundColor = isActive ? .mainBlue : .white
            customButton.tintColor = isActive ? .white : .darkBlue
        }
    }
    
    weak var delegate: CategoryButtonDelegate?
    
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
        button.addTarget(self, action: #selector(didTapCategoryButton), for: .touchUpInside)
        return button
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
    
    // MARK: - Actions
    @objc private func didTapCategoryButton() {
        print("🟢 didTapCategoryButton in CategoryButton class!")
        
        guard let buttonTitle = customButton.titleLabel?.text else { return }
        delegate?.didTapCategoryButton(with: buttonTitle)
    }
    
    // MARK: - Public Methods
    func setTitleWith(_ title: String) {
        customButton.setTitle(title, for: .normal)
    }
    
    func getButtonTitle() -> String {
        guard let buttonTitle = customButton.titleLabel?.text else { return "" }
        return buttonTitle
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        isActive = false
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(customButton)
    }
    
}

// MARK: - SetConstraints
extension CategoryButton {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            customButton.widthAnchor.constraint(equalToConstant: 65),
            customButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
