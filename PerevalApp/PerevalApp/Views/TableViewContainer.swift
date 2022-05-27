import UIKit

class TableViewContainer: UIView {
    
    enum CellIdentifiers: String {
        case cell
    }
    
    // MARK: - Properties
    var model: MountainModel?
    
    // MARK: - Views
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(tableView)
        
        tableView.register(MountainTableViewCell.self,
                           forCellReuseIdentifier: CellIdentifiers.cell.rawValue)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension TableViewContainer: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let model = self.model else { return 0 }
        
        return model.mountains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let model = self.model else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cell.rawValue,
                                                 for: indexPath) as! MountainTableViewCell
        cell.mountain = model.mountains[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TableViewContainer: UITableViewDelegate {
    
}

// MARK: - SetConstraints
extension TableViewContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
