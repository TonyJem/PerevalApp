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
    
    private let cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera2")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "добавить\nописание"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
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
    
    private let pencilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "редакти\nровать"
        label.font = .ptSans12()
        label.textColor = .textGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
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
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftView)
        addSubview(cameraImageView)
        addSubview(plusImageView)
        addSubview(leftLabel)
        addSubview(rightView)
        addSubview(pencilImageView)
        addSubview(rightLabel)
    }
}

// MARK: - SetConstraints
extension EditToolsContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: leftView.bottomAnchor, constant: -1),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftLabel.widthAnchor.constraint(equalToConstant: 50),
            leftLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            leftView.centerXAnchor.constraint(equalTo: leftLabel.centerXAnchor),
            leftView.widthAnchor.constraint(equalToConstant: 42),
            leftView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            cameraImageView.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            cameraImageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            cameraImageView.widthAnchor.constraint(equalToConstant: 20),
            cameraImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            plusImageView.centerXAnchor.constraint(equalTo: cameraImageView.centerXAnchor, constant: 0.5),
            plusImageView.centerYAnchor.constraint(equalTo: cameraImageView.centerYAnchor, constant: 0.5),
            plusImageView.widthAnchor.constraint(equalToConstant: 5),
            plusImageView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        NSLayoutConstraint.activate([
            rightLabel.topAnchor.constraint(equalTo: rightView.bottomAnchor, constant: -1),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightLabel.widthAnchor.constraint(equalToConstant: 50),
            rightLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            rightView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            rightView.centerXAnchor.constraint(equalTo: rightLabel.centerXAnchor),
            rightView.widthAnchor.constraint(equalToConstant: 42),
            rightView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            pencilImageView.centerXAnchor.constraint(equalTo: rightView.centerXAnchor, constant: 1),
            pencilImageView.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            pencilImageView.widthAnchor.constraint(equalToConstant: 20),
            pencilImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
