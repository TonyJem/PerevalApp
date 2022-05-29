import UIKit

class StatisticRowCell: UITableViewCell {
    
    // MARK: - Properties
    var cellData: MenuCellData? {
        didSet {
            updateCellUI()
        }
    }
    
    private var leadingInset: CGFloat {
        guard let cellData = self.cellData else {
            return 0.0
        }

        return cellData.type == .clause ? 0.0 : 10.0
    }
    
    
    // MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .ptSans20()
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .ptSans20()
        label.textColor = .black
        label.textAlignment = .right
        
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(counterLabel)
    }
    
    private func updateCellUI() {
        
        guard let cellData = self.cellData else {
            print("🔴 cellData is nil in StatisticRowCell")
            return
        }
        titleLabel.text = cellData.title
        counterLabel.text = String(cellData.counter)
    }
}

// MARK: - SetConstraints
extension StatisticRowCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25 + leadingInset),
            titleLabel.trailingAnchor.constraint(equalTo: counterLabel.leadingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            counterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            counterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            counterLabel.widthAnchor.constraint(equalToConstant: 30),
            counterLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}
