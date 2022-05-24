import UIKit

class PhotoContainer: UIView {
    
    private var photoIndex = 0
    
    private lazy var menuRows: [String] = {
        var menuRows: [String] = []
        for section in TableSection.allCases {
            menuRows.append(section.rawValue)
            section.rows.forEach { row in
                menuRows.append(row)
            }
        }
        return menuRows
    }()
    
    // MARK: - Views
    private let photoNumLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = ""
        
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
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(photoIndex: Int) {
        self.init()
        
        self.photoIndex = photoIndex
        updatePhotoNumLabel()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    private func setupViews() {
        
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(photoNumLabel)
        addSubview(tableView)
        addSubview(attachPhotoView)
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func updatePhotoNumLabel() {
        photoNumLabel.text = "Фото №\(String(photoIndex))"
    }
}

// MARK: - UITableViewDataSource
extension PhotoContainer: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuRows[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PhotoContainer: UITableViewDelegate {
}

// MARK: - SetConstraints
extension PhotoContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoNumLabel.topAnchor.constraint(equalTo: topAnchor),
            photoNumLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoNumLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoNumLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: photoNumLabel.bottomAnchor, constant: 20),
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
