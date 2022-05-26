import UIKit

protocol EmptyViewContainerDelegate: AnyObject {
    func didTapLinkButton()
}

class EmptyViewContainer: UIView {
    
    weak var delegate: EmptyViewContainerDelegate?
    
    // MARK: - Views
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "explore")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let callToActionLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите на +\nчтобы добавить перевал"
        label.numberOfLines = 0
        label.font = .ptSans27()
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .mainBlue
        button.titleLabel?.font = .dinProMedium19()
        button.setTitle("Посмотреть базу перевалов", for: .normal)
        button.backgroundColor = .clear
        button.underline()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLinkButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc private func didTapLinkButton() {
        delegate?.didTapLinkButton()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(imageView)
        addSubview(callToActionLabel)
        addSubview(linkButton)
    }
}

// MARK: - SetConstraints
extension EmptyViewContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300 * 1.15),
            imageView.heightAnchor.constraint(equalToConstant: 206 * 1.15)
        ])
        
        NSLayoutConstraint.activate([
            callToActionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            callToActionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            callToActionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            callToActionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            linkButton.topAnchor.constraint(equalTo: callToActionLabel.bottomAnchor, constant: 15),
            linkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            linkButton.widthAnchor.constraint(equalToConstant: 270),
            linkButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
