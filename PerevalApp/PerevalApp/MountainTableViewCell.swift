import UIKit

class MountainTableViewCell: UITableViewCell {
    // MARK: - Properties
    var mountain: Mountain? {
        didSet {
            guard let mountain = self.mountain else { return }
            updateCell(with: mountain)
        }
    }
    
    // MARK: - Views
    
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "selected")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .ptSans14()
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        setConstraints()
    }

    
    // MARK: - Private Methods
    private func setupViews() {
        contentView.addSubview(checkImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func updateCell(with mountain: Mountain) {
        nameLabel.text = mountain.name
    }

}

// MARK: - SetConstraints
extension MountainTableViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            checkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkImageView.widthAnchor.constraint(equalToConstant: 15),
            checkImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
