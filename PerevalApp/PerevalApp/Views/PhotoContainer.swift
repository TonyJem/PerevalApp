import UIKit

class PhotoContainer: UIView {
    
    // MARK: - Views
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Фото №1"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let attachPhotoView = AttachPhotoView()
    
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
    
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    private func setupViews() {
        
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(photoLabel)
        addSubview(tableView)
        addSubview(attachPhotoView)
    }
}

// MARK: - SetConstraints
extension PhotoContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: topAnchor),
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            attachPhotoView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            attachPhotoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            attachPhotoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            attachPhotoView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}
