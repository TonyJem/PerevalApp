import UIKit

class LongitudeView: UIView {
    
    private let pickerData = ["E", "W"]
    
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
        
        textField.setHorizontalInsets(8)
        
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let degreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "degree")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let minutesTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .ptSans20()
        textField.textColor = .black
        textField.backgroundColor = .white
        
        textField.layer.borderColor = UIColor.mainBlue.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        
        textField.setHorizontalInsets(10)
        
        textField.returnKeyType = .done
        textField.keyboardType = .decimalPad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let minuteView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        backgroundColor = .green
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(latitudePicker)
        addSubview(degreeTextField)
        addSubview(degreeImageView)
        addSubview(minutesTextField)
        addSubview(minuteView)
    }
    
    private func setDelegates() {
        latitudePicker.dataSource = self
        latitudePicker.delegate = self
        degreeTextField.delegate = self
        minutesTextField.delegate = self
    }
    
}

// MARK: - UIPickerViewDataSource
extension LongitudeView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
}

// MARK: - UIPickerViewDelegate
extension LongitudeView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        25
    }
}

// MARK: - UIPickerViewDelegate
extension LongitudeView: UITextFieldDelegate {
    
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
        case minutesTextField:
            return count <= 7
        default:
            return true
        }
    }
}

// MARK: - SetConstraints
extension LongitudeView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            latitudePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            latitudePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            latitudePicker.widthAnchor.constraint(equalToConstant: 60),
            latitudePicker.heightAnchor.constraint(equalTo: heightAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            degreeTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            degreeTextField.leadingAnchor.constraint(equalTo: latitudePicker.trailingAnchor),
            degreeTextField.widthAnchor.constraint(equalToConstant: 50),
            degreeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            degreeImageView.bottomAnchor.constraint(equalTo: degreeTextField.topAnchor, constant: -3),
            degreeImageView.leadingAnchor.constraint(equalTo: degreeTextField.trailingAnchor, constant: 5),
            degreeImageView.widthAnchor.constraint(equalToConstant: 6),
            degreeImageView.heightAnchor.constraint(equalToConstant: 6)
        ])
        
        NSLayoutConstraint.activate([
            minutesTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            minutesTextField.leadingAnchor.constraint(equalTo: degreeTextField.trailingAnchor, constant: 20),
            minutesTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            minutesTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            minuteView.bottomAnchor.constraint(equalTo: minutesTextField.topAnchor, constant: -3),
            minuteView.trailingAnchor.constraint(equalTo: minutesTextField.trailingAnchor, constant: 5),
            minuteView.widthAnchor.constraint(equalToConstant: 2),
            minuteView.heightAnchor.constraint(equalToConstant: 6)
        ])
        
    }
}
