import UIKit
import SafariServices

class MountainPassListVC: UIViewController {
    
    // MARK: - Properties
    private let model = MountainModel()
    
    private var heightConstraint: NSLayoutConstraint?
    
    private var isBottomPanelVisible = false {
        didSet {
            let menuHeight: CGFloat = isBottomPanelVisible ? 75 : 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.heightConstraint?.constant = menuHeight
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    // MARK: - Views
    private let emptyViewContainer = EmptyViewContainer()
    private let tableViewContainer = TableViewContainer()
    private let bottomPanel = BottomPanel()
    
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
        
        if let name = UserSettings.currentUser?.name,
           let surname = UserSettings.currentUser?.surname {
            title = "\(surname) \(name)"
        }
        
        let logoutButtonImage = UIImage(named: "logOut")
        let logoutButton = UIBarButtonItem(image: logoutButtonImage,
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapRemoveUser))
        navigationItem.setRightBarButton(logoutButton, animated: true)
        
        setupViews()
        setConstraints()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewContainer.reloadMountainPassList()
    }
    
    override func viewDidLayoutSubviews() {
        addButton.layer.cornerRadius = addButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapAddButton() {
        let newMountainPassVC = NewMountainPassVC()
        self.navigationController?.pushViewController(newMountainPassVC, animated: true)
    }
    
    @objc private func didTapRemoveUser() {
        UserSettings.removeUser()
        SceneDelegate.shared.rootViewController.switchToShowWelcomeScreen()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(emptyViewContainer)
        view.addSubview(tableViewContainer)
        view.addSubview(bottomPanel)
        view.addSubview(addButton)
        
        
        addButton.layer.zPosition = 5
        showEmptyViewContainer(for: model.mountains.isEmpty)
        
        tableViewContainer.model = model
    }
    
    private func setupDelegates() {
        emptyViewContainer.delegate = self
        tableViewContainer.delegate = self
        bottomPanel.delegate = self
    }
    
    private func showEmptyViewContainer(for isEmpty: Bool) {
        emptyViewContainer.isHidden = !isEmpty
        tableViewContainer.isHidden = isEmpty
    }
    
    private func shouldShowBottomPanel(_ isShown: Bool) {
        print("🟢 shouldShowBottomPanel: \(isShown)")
    }
    
    private func updateSendButtonTitle() {
        let count = model.selectedMountains.count
        bottomPanel.updateSendButton(with: count)
    }
}

// MARK: - EmptyViewContainerDelegate
extension MountainPassListVC: EmptyViewContainerDelegate {
    func didTapLinkButton() {
        guard let url = URL(string: "https://tssr.ru/pereval") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}

// MARK: - TableViewContainerDelegate
extension MountainPassListVC: TableViewContainerDelegate {
    
    
    
    func didSelectRowFor(item: Int) {
        
        if tableViewContainer.isSelectionModeOn {
            let isSelected = model.mountains[item].isSelected
            model.setSelectionFor(item: item, isSelected: !isSelected)
            tableViewContainer.reloadMountainPassListAt(item)
        } else {
            isBottomPanelVisible = true
            bottomPanel.showButtons()
            model.setSelectionFor(item: item, isSelected: true)
            tableViewContainer.isSelectionModeOn = true
            tableViewContainer.reloadMountainPassList()
        }
        
        updateSendButtonTitle()
    }
    
    func didTapOnAddDescription(with idIndex: Int) {
        let addDescriptionVC = AddDescriptionVC()
        addDescriptionVC.mountainPass = model.mountains[idIndex]
        self.navigationController?.pushViewController(addDescriptionVC, animated: true)
    }
    
    func didTapOnEdit() {
        let editMountainPassVC = EditMountainPassVC()
        self.navigationController?.pushViewController(editMountainPassVC, animated: true)
    }
}

// MARK: - TableViewContainerDelegate
extension MountainPassListVC: BottomPanelDelegate {
    func didTapCancelButton() {
        model.removeAllSelections()
        bottomPanel.hideButtons()
        isBottomPanelVisible = false
        tableViewContainer.isSelectionModeOn = false
        tableViewContainer.reloadMountainPassList()
        updateSendButtonTitle()
    }
}

// MARK: - SetConstraints
extension MountainPassListVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            emptyViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emptyViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            emptyViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomPanel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomPanel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomPanel.bottomAnchor.constraint(equalTo: addButton.centerYAnchor)
        ])
        heightConstraint = bottomPanel.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true

        NSLayoutConstraint.activate([
            tableViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            tableViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewContainer.bottomAnchor.constraint(equalTo: bottomPanel.topAnchor)
        ])
    }
}
