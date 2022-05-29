import UIKit

enum MenuCellType {
    case clause
    case subclause
}

struct MenuCell {
    let title: String
    let type: MenuCellType
    let count: String
}

class DescriptionContainer: UIView {
    
    // MARK: - Properties
    
    var mountain: Mountain?
    
    private lazy var menuCells: [MenuCell] = {
        
        var menuCells: [MenuCell] = []
        
        guard let mountain = self.mountain else { return menuCells }
        
        for (sectionIndex, section) in TableSection.allCases.enumerated() {
            let clauseCell = MenuCell(title: section.rawValue,
                                      type: .clause,
                                      count: mountain.getPhotoCountFor(section: sectionIndex, row: 0))
            menuCells.append(clauseCell)
            
            for (rowIndex, row) in section.rows.enumerated() {
                let subClauseCell = MenuCell(title: section.rawValue,
                                             type: .subclause,
                                             count: mountain.getPhotoCountFor(section: sectionIndex, row: 0))
                menuCells.append(subClauseCell)
            }
        }
        return menuCells
    }()
    
    // MARK: - Views
    private let separatorView1 = SeparatorView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Добавьте описание"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView2 = SeparatorView()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans18()
        label.textColor = .dimedBlack
        label.textAlignment = .left
        label.text = "Для каждой фото можно указать\nкоординаты и направление съёмки"
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorView1)
        addSubview(titleLabel)
        addSubview(separatorView2)
        addSubview(subTitleLabel)
        addSubview(tableView)
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
    }
    
    // MARK: - Public Methods
}

// MARK: - UITableViewDataSource
extension DescriptionContainer: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuCells[indexPath.row].title
        
        return cell
    }
}

// MARK: - SetConstraints
extension DescriptionContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            separatorView1.topAnchor.constraint(equalTo: topAnchor),
            separatorView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            separatorView2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            separatorView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 7),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
