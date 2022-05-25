import UIKit

protocol PhotoContainerDelegate: AnyObject {
    func didTapOnGaleryView()
}

class PhotoContainer: UIView {
    
    weak var delegate: PhotoContainerDelegate?
    
    private let initialText: String = "Что на фото?"
    private var selectedPictureTitle: String?
    
    private var photoIndex = 0
    private var selectedRowIndex: Int?
    
    private var HeightConstraint: NSLayoutConstraint?
    
    private var isTableViewShown = false {
        didSet {
            let menuHeight: CGFloat = isTableViewShown ? 200 : 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.HeightConstraint?.constant = menuHeight
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
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
    
    private lazy var frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.darkGray.cgColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnFrameView))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let frameLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let frameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Triangle")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let attachPhotoView = AttachPhotoView()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    convenience init(photoIndex: Int) {
        self.init()
        
        self.photoIndex = photoIndex
        updatePhotoNumLabel()
    }
    
    // MARK: - Actions
    @objc private func didTapOnFrameView() {
        isTableViewShown = !isTableViewShown
    }
    
    // MARK: - Public Methods
    func setPhotoImageWith(image: UIImage?) {
        photoImageView.image = image
    }
    
    func hideEntriesAndShowPicture() {
        photoImageView.isHidden = false
        frameView.isHidden = true
        frameLabel.isHidden = true
        frameImageView.isHidden = true
        tableView.isHidden = true
        attachPhotoView.isHidden = true
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(photoNumLabel)
        addSubview(frameView)
        addSubview(frameLabel)
        addSubview(frameImageView)
        addSubview(tableView)
        addSubview(attachPhotoView)
        addSubview(photoImageView)
        
        setFrameLabel(with: initialText)
        photoImageView.isHidden = true
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        attachPhotoView.delegate = self
    }
    
    private func updatePhotoNumLabel() {
        photoNumLabel.text = "Фото №\(String(photoIndex))"
    }
    
    private func setFrameLabel(with text: String) {
        frameLabel.text = text
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
        
        if indexPath.row == selectedRowIndex {
            cell.backgroundColor = .mainBlue
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PhotoContainer: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedRowIndex == indexPath.row {
            setFrameLabel(with: initialText)
            selectedRowIndex = nil
            selectedPictureTitle = nil
            tableView.reloadData()
        } else {
            selectedRowIndex = indexPath.row
            tableView.reloadData()
            setFrameLabel(with: menuRows[indexPath.row])
            selectedPictureTitle = menuRows[indexPath.row]
            isTableViewShown = false
        }
    }
}

// MARK: - AttachPhotoViewDelegate
extension PhotoContainer: AttachPhotoViewDelegate {
    func didTapOnGaleryView() {
        print("🟢🟢 didTapOnGaleryView in PhotoContainer")
        
        guard let pictureTitle = selectedPictureTitle else {
            print("🟠 Picture title is not selected!")
            return
        }
        photoNumLabel.text = "Фото №\(String(photoIndex)). \(pictureTitle)"
        delegate?.didTapOnGaleryView()
    }
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
            frameView.topAnchor.constraint(equalTo: photoNumLabel.bottomAnchor, constant: 10),
            frameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            frameLabel.centerYAnchor.constraint(equalTo: frameView.centerYAnchor),
            frameLabel.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 25),
            frameLabel.trailingAnchor.constraint(lessThanOrEqualTo: frameImageView.leadingAnchor, constant: -15),
            frameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            frameImageView.centerYAnchor.constraint(equalTo: frameView.centerYAnchor, constant: 3),
            frameImageView.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -25),
            frameImageView.widthAnchor.constraint(equalToConstant: 12),
            frameImageView.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: frameView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        HeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
        HeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            attachPhotoView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            attachPhotoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            attachPhotoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            attachPhotoView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: photoNumLabel.bottomAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
    }
}
