import UIKit

class CalendarView: UIView {
    
    // MARK: - Views
    private let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12.04.1961"
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
        
        
        addSubview(calendarImageView)
        addSubview(dateLabel)
    }
    
    // MARK: - Public Methods
    func setDateTitle(_ title: String) {
        dateLabel.text = title
    }
}

// MARK: - SetConstraints
extension CalendarView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            calendarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            calendarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            calendarImageView.widthAnchor.constraint(equalToConstant: 25),
            calendarImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

