import UIKit

class AddDescriptionVC: UIViewController {
    
    // MARK: - Properties
    var mountainPass: Mountain?
    
    private var photo: Photo?
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 200)
    }
    
    // MARK: - Views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentSize
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = ""
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let photoContainer = PhotoContainer()
    
    private lazy var addNewBlockButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .mainBlue
        button.titleLabel?.font = .ptSans22()
        button.setTitle("ДОБАВИТЬ БЛОК", for: .normal)
        
        button.layer.borderColor = UIColor.mainBlue.cgColor
        button.layer.borderWidth = 1.0
        
        button.backgroundColor = .white
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAddNewBlockButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomSaveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptSans22()
        button.setTitle("СОХРАНИТЬ", for: .normal)
        
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        addNewBlockButton.layer.cornerRadius = addNewBlockButton.frame.height / 2
        bottomSaveButton.layer.cornerRadius = bottomSaveButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func importPictureFromGallery() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func didTapAddNewBlockButton() {
        print("🟢 didTapAddNewBlockButton in AddDescriptionVC")
    }
    
    @objc private func didTapSaveButton() {
        guard let photo = self.photo else {
            print("🔴 Photo is nil in AddDescriptionVC")
            return
        }
        
        mountainPass?.setPhoto(photo: photo)
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        title = "Добавление описания"
        
        let saveButton = UIBarButtonItem(title: "Сохранить",
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapSaveButton))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(photoContainer)
        contentView.addSubview(addNewBlockButton)
        contentView.addSubview(bottomSaveButton)
        
        guard let mountainPass = self.mountainPass else { return }
        
        let nextPhotoNumber = mountainPass.photosCount + 1
        photoContainer.updatePhotoNumLabel(with: nextPhotoNumber)
        titleLabel.text = mountainPass.title
    }
    
    private func setDelegates() {
        photoContainer.delegate = self
    }
}

// MARK: - UIImage PickerController Delegate
extension AddDescriptionVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        photoContainer.setAndSavePhotoImage(image: image)
    }
}

// MARK: - PhotoContainerDelegate
extension AddDescriptionVC: PhotoContainerDelegate {
    func didAddImage(image: Image) {
        print("🔴 didAddImage is not implemented yet")
    }
    
    func didAddPhoto(photo: Photo) {
        self.photo = photo
    }
    
    func didTapOnGaleryView() {
        importPictureFromGallery()
        photoContainer.hideEntriesAndShowPicture()
    }
}

// MARK: - SetConstraints
extension AddDescriptionVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            photoContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            photoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            photoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            photoContainer.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        NSLayoutConstraint.activate([
            addNewBlockButton.topAnchor.constraint(equalTo: photoContainer.bottomAnchor),
            addNewBlockButton.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: 30),
            addNewBlockButton.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: -30),
            addNewBlockButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            bottomSaveButton.topAnchor.constraint(equalTo: addNewBlockButton.bottomAnchor, constant: 30),
            bottomSaveButton.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: 30),
            bottomSaveButton.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: -30),
            bottomSaveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
