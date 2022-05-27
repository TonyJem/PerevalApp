import UIKit

class EditToolsContainer: UIView {
    
    // MARK: - Views
    private let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        view.layer.cornerRadius = 21.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "добавить\nописание"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 1.0,
                             lineHeightMultiple: 0.5)
        
        label.backgroundColor = .systemPink
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        view.layer.cornerRadius = 21.0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "редакти\nровать"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 1.0,
                             lineHeightMultiple: 0.5)
        
        label.backgroundColor = .systemPink
        
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
        backgroundColor = .green
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftView)
        addSubview(leftLabel)
        addSubview(rightView)
        addSubview(rightLabel)
    }
}

// MARK: - SetConstraints
extension EditToolsContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: leftView.bottomAnchor, constant: 5),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            leftLabel.widthAnchor.constraint(equalToConstant: 50),
            leftLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            leftView.centerXAnchor.constraint(equalTo: leftLabel.centerXAnchor, constant: 0),
            leftView.widthAnchor.constraint(equalToConstant: 42),
            leftView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            rightLabel.topAnchor.constraint(equalTo: leftView.bottomAnchor, constant: 5),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            rightLabel.widthAnchor.constraint(equalToConstant: 50),
            rightLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            rightView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            rightView.centerXAnchor.constraint(equalTo: rightLabel.centerXAnchor, constant: 0),
            rightView.widthAnchor.constraint(equalToConstant: 42),
            rightView.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}
