import UIKit

protocol MountainTableViewCellDelegate: AnyObject {
    func didTapOnAddDescription(with idIndex: Int)
    func didTapOnEdit()
}

class MountainTableViewCell: UITableViewCell {
    
    var idIndex: Int?
    
    weak var mountainTableViewCellDelegate: MountainTableViewCellDelegate?
    
    // MARK: - Properties
    var isSelectionModeOn = false
    
    var mountain: Mountain? {
        didSet {
            guard let mountain = self.mountain else { return }
            updateCell(with: mountain)
        }
    }
    
    // MARK: - Views
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
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
    
    private let editToolsContainer = EditToolsContainer()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
        setupDelegates()
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
        nameLabel.text = mountain.name
        
        let isSelected = mountain.isSelected
        let imageName = isSelected ? "selected" : "notSelected"
        checkImageView.image = UIImage(named: imageName)
        checkImageView.isHidden = !isSelectionModeOn
    }
    
    private func setupDelegates() {
        editToolsContainer.delegate = self
    }
}

// MARK: - EditToolsContainerDelegate
extension MountainTableViewCell: EditToolsContainerDelegate {
    
    func didTapOnLeftView() {
        guard let idIndex = self.idIndex else { return }
        mountainTableViewCellDelegate?.didTapOnAddDescription(with: idIndex)
    }

    func didTapOnRightView() {
        mountainTableViewCellDelegate?.didTapOnEdit()
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
            editToolsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            editToolsContainer.widthAnchor.constraint(equalToConstant: 110),
            editToolsContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
