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
        label.font = .ptSans16()
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        contentView.addSubview(checkImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func updateCell(with mountain: Mountain) {
        print("🟡 Will UpdateCell...")
        nameLabel.text = mountain.name
    }

}

// MARK: - SetConstraints
extension MountainTableViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            checkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            checkImageView.widthAnchor.constraint(equalToConstant: 18),
            checkImageView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
