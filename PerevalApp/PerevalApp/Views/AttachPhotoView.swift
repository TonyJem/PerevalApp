import UIKit

class AttachPhotoView: UIView {
    // MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавьте фото"

        label.font = .ptSans20()
        label.textColor = .borderGray
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let galeryView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let photoView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        addSubview(titleLabel)
        addSubview(galeryView)
        addSubview(photoView)
    }
}

// MARK: - SetConstraints
extension AttachPhotoView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            galeryView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            galeryView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            galeryView.widthAnchor.constraint(equalToConstant: 60),
            galeryView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            photoView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            photoView.widthAnchor.constraint(equalToConstant: 60),
            photoView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
