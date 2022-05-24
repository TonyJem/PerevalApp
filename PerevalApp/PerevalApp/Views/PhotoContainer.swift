import UIKit

class PhotoContainer: UIView {
    
    // MARK: - Views
    
    let customView: UIView = {
        let view = UIView()
        
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
    
    // MARK: - Actions
    
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    private func setupViews() {
        
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(customView)
    }
}

// MARK: - SetConstraints
extension PhotoContainer {
    private func setConstraints() {
        
//        NSLayoutConstraint.activate([
//
//            customView.widthAnchor.constraint(equalToConstant: 65),
//            customView.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }
}
