import UIKit

class AddNewMountainPassVC: UIViewController {
    
    // MARK: - Views
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.setHorizontalInsets(10)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Название перевала"
        textField.font = .ptSans18()
        textField.layer.borderColor = UIColor.borderGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptMonoBold()
        button.setTitle("i", for: .normal)
        
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
        return button
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Категория перевала"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        
        let titles = ["Н/К",
                      "1A",
                      "1Б"]
        
        for title in titles {
            let button = CategoryButton()
            button.setTitleWith(title)
            stackView.addArrangedSubview(button)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 80
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackView2: UIStackView = {
        let stackView = UIStackView()
        
        let titles = ["2A",
                      "2Б",
                      "3A",
                      "3Б"]
        
        for title in titles {
            let button = CategoryButton()
            button.setTitleWith(title)
            stackView.addArrangedSubview(button)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let additionLabel: UILabel = {
        let label = UILabel()
        label.font = .dinProMedium14()
        label.textColor = .darkBlue
        label.textAlignment = .left
        label.text = "Добавить"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let additionStackView: UIStackView = {
        let stackView = UIStackView()
        
        let butonTitles = ["*",
                      "не уверен",
                      "оценочно"]
        
        let labelTexts = ["Сложность существенно увеличится в зависимости от погодных условий (снегопад, внезапное облединение склонов и пр.)",
                          "Если вы не уверены в оценке категории",
                          "Если вы не прошли этот перевал"
        ]
        
        for (index, title) in butonTitles.enumerated() {
            let view = AdditionButton()
            view.setButtonTitle(title)
            view.setLabelTitle(labelTexts[index])
            stackView.addArrangedSubview(view)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 31
//        stackView.backgroundColor = .systemPink
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let separatorView = SeparatorView()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Дата прохождения"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calendarView = CalendarView()
    private let todayView = TodayView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        infoButton.layer.cornerRadius = infoButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapInfoButton() {
        print("🟢 didTapInfoButton in AddNewMountainPassVC")
    }
    
    @objc private func didTapCategoryButton() {
        print("🟢 didTapCategoryButton in AddNewMountainPassVC")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(textField)
        view.addSubview(infoButton)
        view.addSubview(categoryLabel)
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        view.addSubview(additionLabel)
        view.addSubview(additionStackView)
        view.addSubview(separatorView)
        view.addSubview(dateLabel)
        view.addSubview(calendarView)
        view.addSubview(todayView)
    }
}

// MARK: - SetConstraints
extension AddNewMountainPassVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            infoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalTo: infoButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: infoButton.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            categoryLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: 0),
            categoryLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackView1.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 30),
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackView2.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            additionLabel.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 20),
            additionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            additionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            additionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            additionStackView.topAnchor.constraint(equalTo: additionLabel.bottomAnchor, constant: 3),
            additionStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            additionStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            additionStackView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: additionStackView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            dateLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            calendarView.widthAnchor.constraint(equalToConstant: 200),
            calendarView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            todayView.topAnchor.constraint(equalTo: calendarView.topAnchor),
            todayView.leadingAnchor.constraint(equalTo: calendarView.trailingAnchor, constant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            todayView.heightAnchor.constraint(equalTo: calendarView.heightAnchor)
        ])
    }
}
