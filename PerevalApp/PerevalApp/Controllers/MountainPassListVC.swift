import UIKit
import SafariServices

class MountainPassListVC: UIViewController {
    
    // MARK: - Views
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "explore")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let callToActionLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите на +\nчтобы добавить перевал"
        label.numberOfLines = 0
        label.font = .ptSans27()
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .mainBlue
        button.titleLabel?.font = .dinProMedium19()
        button.setTitle("Посмотреть базу перевалов", for: .normal)
        button.backgroundColor = .clear
        button.underline()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLinkButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.titleLabel?.font = .dinProMedium60()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        addButton.layer.cornerRadius = addButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapAddButton() {
        print("🟢 didTapAddButton in MountainPassListVC")
        
        let addNewMountainPassVC = AddNewMountainPassVC()
        addNewMountainPassVC.modalPresentationStyle = .fullScreen
        present(addNewMountainPassVC, animated: true)
    }
    
    @objc private func didTapLinkButton() {
        guard let url = URL(string: "https://tssr.ru/pereval") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(callToActionLabel)
        view.addSubview(linkButton)
        view.addSubview(addButton)
    }
}

// MARK: - SetConstraints
extension MountainPassListVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300 * 1.15),
            imageView.heightAnchor.constraint(equalToConstant: 206 * 1.15)
        ])
        
        NSLayoutConstraint.activate([
            callToActionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            callToActionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            callToActionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            callToActionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            linkButton.topAnchor.constraint(equalTo: callToActionLabel.bottomAnchor, constant: 15),
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.widthAnchor.constraint(equalToConstant: 270),
            linkButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
        ])
    }
}
