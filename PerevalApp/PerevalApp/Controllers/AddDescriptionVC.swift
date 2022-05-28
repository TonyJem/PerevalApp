import UIKit

class AddDescriptionVC: UIViewController {
    
    // MARK: - Properties
    private let apiService = APIService()
    private let model = MountainPassModel()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 1000)
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
    
    private let photoContainer = PhotoContainer(photoIndex: 1)
    
    private lazy var bottomSaveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptSans22()
        button.setTitle("ОТПРАВИТЬ".uppercased(), for: .normal)
        
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapBottomSaveButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveButton = UIBarButtonItem(title: "Сохранить",
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapSave))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        setDelegates()
        initializeHideKeyboard()
        
    }
    
    override func viewDidLayoutSubviews() {
        bottomSaveButton.layer.cornerRadius = bottomSaveButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc func importPictureFromGallery() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc private func didTapSave() {
        print("🟢 didTapSave in AddDescriptionVC")
        /*
         TODO:
         it should save currently entered changes, even if
         add save to model or to DB functionality here
         need to decide, should we go back or stay in current ViewController
         */
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func didTapBottomSaveButton() {
        print("🟢 didTapBottomSaveButton in AddDescriptionVC")

    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photoContainer)
        contentView.addSubview(bottomSaveButton)
    }
    
    private func setDelegates() {
        photoContainer.delegate = self
    }
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
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
        print("🟢🟢🟢 didTapOnGaleryView in AddDescriptionVC")
        importPictureFromGallery()
        photoContainer.hideEntriesAndShowPicture()
    }
    
    func didAddImage(image: Image) {
        print("🟢🟢🟢 didAddImage in AddDescriptionVC")
        model.addImage(image)
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
