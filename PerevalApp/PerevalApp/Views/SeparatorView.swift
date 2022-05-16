import UIKit

class SeparatorView: UIView {
    
    // MARK: - Views
    private let coloredView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        addSubview(coloredView)
    }
}

// MARK: - SetConstraints
extension SeparatorView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            coloredView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            coloredView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            coloredView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            coloredView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
