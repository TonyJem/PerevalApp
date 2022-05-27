import UIKit

class EditToolsContainer: UIView {
    
    // MARK: - Views
    private let addDescriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        view.layer.cornerRadius = 21.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "добавить\nописание"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 1.0,
                             lineHeightMultiple: 0.5)
        
        label.backgroundColor = .systemPink
        
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
        backgroundColor = .green
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(addDescriptionView)
        addSubview(addDescriptionLabel)
    }
}

// MARK: - SetConstraints
extension EditToolsContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            addDescriptionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            addDescriptionView.centerXAnchor.constraint(equalTo: addDescriptionLabel.centerXAnchor, constant: 0),
            addDescriptionView.widthAnchor.constraint(equalToConstant: 42),
            addDescriptionView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            addDescriptionLabel.topAnchor.constraint(equalTo: addDescriptionView.bottomAnchor, constant: 5),
            addDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            addDescriptionLabel.widthAnchor.constraint(equalToConstant: 50),
            addDescriptionLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
}
