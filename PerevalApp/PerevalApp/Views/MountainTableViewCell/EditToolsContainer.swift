import UIKit

class EditToolsContainer: UIView {
    
    // MARK: - Views
    private let addDescriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        view.layer.cornerRadius = 23.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "добавить описание"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
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
            addDescriptionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            addDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            addDescriptionView.widthAnchor.constraint(equalToConstant: 46),
            addDescriptionView.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            addDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            addDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            addDescriptionLabel.widthAnchor.constraint(equalToConstant: 46),
            addDescriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
