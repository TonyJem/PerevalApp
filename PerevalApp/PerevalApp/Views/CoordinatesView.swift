import UIKit

class CoordinatesView: UIView {
    
    // MARK: - Views
    private let pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "locationPin")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "N 55 36.4999"
        label.font = .ptSans20()
        label.textColor = .darkBlue
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "E 37 18.2332"
        label.font = .ptSans20()
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
    
    // MARK: - Private Methods
    private func setupViews() {
        layer.borderColor = UIColor.mainBlue.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pinImageView)
        addSubview(topLabel)
        addSubview(bottomLabel)
    }
    
    // MARK: - Public Methods
    func setLatitude(_ text: String) {
        topLabel.text = text
    }
    func setLongitude(_ text: String) {
        bottomLabel.text = text
    }
}

// MARK: - SetConstraints
extension CoordinatesView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            pinImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pinImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            pinImageView.widthAnchor.constraint(equalToConstant: 35),
            pinImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            topLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            topLabel.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor, constant: 12),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            topLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            bottomLabel.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor, constant: 12),
            bottomLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            bottomLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
