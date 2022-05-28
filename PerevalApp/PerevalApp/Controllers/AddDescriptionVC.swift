import UIKit

class AddDescriptionVC: UIViewController {
    
    // MARK: - Properties
    
    private var mountainPass: Mountain?
    private var image: Image?
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 500)
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
    
    private let photoContainer = PhotoContainer()
    
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
        bottomSaveButton.layer.cornerRadius = bottomSaveButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func importPictureFromGallery() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func didTapSaveButton() {
        print("🟢 didTapSaveButton in AddDescriptionVC")
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        let saveButton = UIBarButtonItem(title: "Сохранить",
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapSaveButton))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photoContainer)
        contentView.addSubview(bottomSaveButton)
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
    
    func didTapOnGaleryView() {
        importPictureFromGallery()
        photoContainer.hideEntriesAndShowPicture()
    }
    
    func didAddImage(image: Image) {
        self.image = image
    }
}

// MARK: - SetConstraints
extension AddDescriptionVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            photoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            photoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            photoContainer.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        NSLayoutConstraint.activate([
            bottomSaveButton.topAnchor.constraint(equalTo: photoContainer.bottomAnchor, constant: 60),
            bottomSaveButton.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: 30),
            bottomSaveButton.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: -30),
            bottomSaveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
