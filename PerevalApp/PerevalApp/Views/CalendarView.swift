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
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.timeZone = NSTimeZone.local
        picker.locale = NSLocale(localeIdentifier: "ru") as Locale
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
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
        addSubview(datePicker)
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
            datePicker.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            datePicker.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 4),
            datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4)
        ])
    }
}
