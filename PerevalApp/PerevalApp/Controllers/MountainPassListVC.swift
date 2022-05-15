import UIKit

class MountainPassListVC: UIViewController {
    
    // MARK: - Views
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
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(addButton)
    }
}

// MARK: - SetConstraints
extension MountainPassListVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
        ])
    }
}
