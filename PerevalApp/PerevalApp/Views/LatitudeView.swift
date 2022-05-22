import UIKit

class LatitudeView: UIView {
    
    // MARK: - Views
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "N 55 36.4999"
        label.font = .ptSans20()
        label.textColor = .darkBlue
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.layer.borderColor = UIColor.mainBlue.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 3
        
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
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topLabel)
    }
    
}

// MARK: - SetConstraints
extension LatitudeView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            topLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
}
