import UIKit

class LatitudeView: UIView {
    
    private let pickerData = ["N", "S"]
    
    // MARK: - Views
    private let latitudePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .green
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
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
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topLabel)
        addSubview(latitudePicker)
    }
    
    private func setDelegates() {
        latitudePicker.dataSource = self
        latitudePicker.delegate = self
    }
    
}

// MARK: - UIPickerViewDataSource
extension LatitudeView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count * 1000
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row % 2 == 0 {
            return pickerData[0]
        } else {
            return pickerData[1]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        60
    }
    

}

// MARK: - SetConstraints
extension LatitudeView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            topLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            latitudePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            latitudePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            latitudePicker.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: -12),
            latitudePicker.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
    }
}
