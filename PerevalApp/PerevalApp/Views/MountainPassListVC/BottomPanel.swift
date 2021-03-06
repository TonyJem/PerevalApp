import UIKit

protocol BottomPanelDelegate: AnyObject {
    func didTapCancelButton()
}

class BottomPanel: UIView {
    
    weak var delegate: BottomPanelDelegate?
    
    // MARK: - Views
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.titleLabel?.font = .ptSans16()
        button.setTitle("ОТМЕНА", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.titleLabel?.font = .ptSans16()
        button.setTitle("", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorView)
        addSubview(cancelButton)
        addSubview(sendButton)
        
        hideButtons()
    }
    
    // MARK: - Actions
    @objc private func didTapCancelButton() {
        delegate?.didTapCancelButton()
    }
    
    @objc private func didTapSendButton() {
        print("🟢 didTapSendButton in BottomPanel")
    }
    
    // MARK: - Public Methods
    func updateSendButton(with count: Int ) {
        sendButton.setTitle("ОТПРАВИТЬ (\(count))", for: .normal)
    }
    
    func showButtons() {
        cancelButton.isHidden = false
        sendButton.isHidden = false
    }
    
    func hideButtons() {
        cancelButton.isHidden = true
        sendButton.isHidden = true
    }
}

// MARK: - SetConstraints
extension BottomPanel {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cancelButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            sendButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
