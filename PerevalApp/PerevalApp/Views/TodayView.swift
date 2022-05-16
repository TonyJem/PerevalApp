import UIKit

class TodayView: UIView {
    
    // MARK: - Views
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня"
        label.font = .ptSans18()
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "(22.05.2022)"
        label.font = .ptSans18()
        label.textColor = .white
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
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .mainBlue
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(todayLabel)
        addSubview(dateLabel)
    }
    
    // MARK: - Public Methods
    func setDateTitle(_ title: String) {
        dateLabel.text = title
    }
}

// MARK: - SetConstraints
extension TodayView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            todayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -5),
            todayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            todayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 60),
            todayLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 60),
            dateLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 60)
        ])
    }
}
