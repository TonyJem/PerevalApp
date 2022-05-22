import UIKit

class AltitudeView: UIView {
    
    // MARK: - Views
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.font = .ptSans12()
        label.textColor = .specialGray
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "1800 м"
        label.font = .ptSans18()
        label.textColor = .darkBlue
        label.textAlignment = .center
        
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
    
    // MARK: - Public Methods
    func setAltitude(_ altitude: String) {
        valueLabel.text = "\(altitude) м"
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        layer.borderColor = UIColor.mainBlue.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionLabel)
        addSubview(valueLabel)
    }
}

// MARK: - SetConstraints
extension AltitudeView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            valueLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10),
            valueLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20)
        ])
    }
}
