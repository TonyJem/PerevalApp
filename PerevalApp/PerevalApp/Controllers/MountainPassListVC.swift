import UIKit

class MountainPassListVC: UIViewController {
    
    // MARK: - Views
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        
        let title = "+"
        button.setTitle(title, for: .normal)
        
        button.backgroundColor = .green
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        setupViews()
        setConstraints()
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
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
