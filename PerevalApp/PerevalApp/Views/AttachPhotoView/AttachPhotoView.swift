import UIKit

protocol AttachPhotoViewDelegate: AnyObject {
    func didTapOnGaleryView()
}

class AttachPhotoView: UIView {
    
    weak var delegate: AttachPhotoViewDelegate?
    
    // MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавьте фото"
        
        label.font = .montserratItalic22()
        label.textColor = .darkGray
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var galeryView: GaleryView = {
        let galeryView = GaleryView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnGaleryView))
        galeryView.addGestureRecognizer(tap)
        galeryView.isUserInteractionEnabled = true
        
        return galeryView
    }()
    
    private let photoView = PhotoView()
    
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
    @objc private func didTapOnGaleryView() {
        print("🟢 didTapOnGaleryView in AttachPhotoView")
        delegate?.didTapOnGaleryView()
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
            galeryView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            galeryView.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -30),
            galeryView.widthAnchor.constraint(equalToConstant: 90),
            galeryView.heightAnchor.constraint(equalTo: galeryView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            photoView.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 30),
            photoView.widthAnchor.constraint(equalToConstant: 90),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor)
        ])
    }
}
