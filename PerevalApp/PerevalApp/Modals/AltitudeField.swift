import UIKit

class AltitudeField: UIView {
    
    private let pickerData = ["H"]
    
    // MARK: - Views
    private let altitudePicker: UIPickerView = {
        let picker = UIPickerView()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        
        textField.font = .ptSans20()
        textField.textColor = .black
        textField.backgroundColor = .white
        
        textField.layer.borderColor = UIColor.mainBlue.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        
        textField.setHorizontalInsets(8)
        
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "м"
        label.font = .ptSans18()
        label.textColor = .black
        
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
        backgroundColor = .cyan
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(altitudePicker)
        addSubview(textField)
        addSubview(label)
    }
    
    private func setDelegates() {
        altitudePicker.dataSource = self
        altitudePicker.delegate = self
        textField.delegate = self
    }
    
}

// MARK: - UIPickerViewDataSource
extension AltitudeField: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
}

// MARK: - UIPickerViewDelegate
extension AltitudeField: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        25
    }
}

// MARK: - UITextFieldDelegate
extension AltitudeField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        return count <= 4
    }
}

// MARK: - SetConstraints
extension AltitudeField {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            altitudePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            altitudePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            altitudePicker.widthAnchor.constraint(equalToConstant: 60),
            altitudePicker.heightAnchor.constraint(equalTo: heightAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: altitudePicker.trailingAnchor),
            textField.widthAnchor.constraint(equalToConstant: 70),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 5),
            label.widthAnchor.constraint(equalToConstant: 20),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
