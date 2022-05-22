import UIKit

class LatitudeView: UIView {
    
    private let pickerData = ["N", "S"]
    
    // MARK: - Views
    private let latitudePicker: UIPickerView = {
        let picker = UIPickerView()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let degreeTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .ptSans20()
        textField.textColor = .black
        textField.backgroundColor = .white
        
        textField.layer.borderColor = UIColor.mainBlue.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        
        textField.setHorizontalInsets(5)
        
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        
        addSubview(latitudePicker)
        addSubview(degreeTextField)
    }
    
    private func setDelegates() {
        latitudePicker.dataSource = self
        latitudePicker.delegate = self
        degreeTextField.delegate = self
    }
    
}

// MARK: - UIPickerViewDataSource
extension LatitudeView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
}

// MARK: - UIPickerViewDelegate
extension LatitudeView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        25
    }
}

// MARK: - UIPickerViewDelegate
extension LatitudeView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        switch textField {
        case degreeTextField:
            return count <= 3
        default:
            return true
        }
    }
}

// MARK: - SetConstraints
extension LatitudeView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            latitudePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            latitudePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            latitudePicker.widthAnchor.constraint(equalToConstant: 60),
            latitudePicker.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            degreeTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            degreeTextField.leadingAnchor.constraint(equalTo: latitudePicker.trailingAnchor),
            degreeTextField.widthAnchor.constraint(equalToConstant: 50),
            degreeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
