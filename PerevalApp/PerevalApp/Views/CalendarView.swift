import UIKit

protocol CalendarViewDelegate: AnyObject {
    func editingDidEndOnDatePicker(with date: String)
}

class CalendarView: UIView {
    
    weak var delegate: CalendarViewDelegate?
    
    // MARK: - Views
    private let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.timeZone = NSTimeZone.local
        picker.locale = NSLocale(localeIdentifier: "ru") as Locale
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.addTarget(self, action: #selector(editingDidEndOnDatePicker), for: .editingDidEnd)
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
    
    // MARK: - Actions
    @objc private func editingDidEndOnDatePicker() {
        
        let dateString = getDate()
        print("🟩🟩🟩 editingDidEndOnDatePicker dateString: \(dateString)")
        
        delegate?.editingDidEndOnDatePicker(with: dateString)
    }
    
    // MARK: - Public Methods
    func getDate() -> String {
        let date = datePicker.date
        print("🟣 Date: \(date)")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        let dateString = formatter.string(from: date)
        print("🟣🟣 DateString: \(dateString)")
        
        return dateString
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
