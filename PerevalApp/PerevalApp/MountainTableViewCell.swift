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
    
    private let statisticLabel: UILabel = {
        let label = UILabel()
        label.text = "Подъём 0/3   Седловина 1/5   Спуск 0/3"
        label.font = .ptSans11()
        label.textColor = .darkGray
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "22 мая  2022"
        label.font = .ptSans11()
        label.textColor = .darkGray
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let editToolsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(statisticLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(editToolsContainer)
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
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            checkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            checkImageView.widthAnchor.constraint(equalToConstant: 18),
            checkImageView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            statisticLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            statisticLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            statisticLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            editToolsContainer.topAnchor.constraint(equalTo: topAnchor),
            editToolsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            editToolsContainer.widthAnchor.constraint(equalToConstant: 100),
            editToolsContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
