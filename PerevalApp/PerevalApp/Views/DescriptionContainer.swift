import UIKit

class DescriptionContainer: UIView {
    
    // MARK: - Views

    private let separatorView1 = SeparatorView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Добавьте описание"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView2 = SeparatorView()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans18()
        label.textColor = .dimedBlack
        label.textAlignment = .left
        label.text = "Для каждой фото можно указать\nкоординаты и направление съёмки"
        label.numberOfLines = 0
        
        label.backgroundColor = .green
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorView1)
        addSubview(titleLabel)
        addSubview(separatorView2)
        addSubview(subTitleLabel)
        
    }
    
    // MARK: - Public Methods
}

// MARK: - SetConstraints
extension DescriptionContainer {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            separatorView1.topAnchor.constraint(equalTo: topAnchor),
            separatorView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            separatorView2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            separatorView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 7),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}