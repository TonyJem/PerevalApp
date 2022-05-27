import UIKit

class EditToolsContainer: UIView {
    
    // MARK: - Views
    private let addLeftDescriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        view.layer.cornerRadius = 21.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addLeftDescriptionLabel: UILabel = {
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
        
        addSubview(addLeftDescriptionView)
        addSubview(addLeftDescriptionLabel)
    }
}

// MARK: - SetConstraints
extension EditToolsContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            addLeftDescriptionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            addLeftDescriptionView.centerXAnchor.constraint(equalTo: addLeftDescriptionLabel.centerXAnchor, constant: 0),
            addLeftDescriptionView.widthAnchor.constraint(equalToConstant: 42),
            addLeftDescriptionView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            addLeftDescriptionLabel.topAnchor.constraint(equalTo: addLeftDescriptionView.bottomAnchor, constant: 5),
            addLeftDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            addLeftDescriptionLabel.widthAnchor.constraint(equalToConstant: 50),
            addLeftDescriptionLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
}
