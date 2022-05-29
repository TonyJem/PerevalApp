import UIKit

class EditMountainPassVC: UIViewController {
    
    // MARK: - Properties
    private let model = MountainPassModel()
    private let coordinatesModal = CoordinatesModal()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 500)
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
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.setHorizontalInsets(10)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Название перевала"
        textField.font = .ptSans18()
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let separatorView1 = SeparatorView()
    
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
    
    private let coordintatesLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Координаты"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView2 = SeparatorView()
    
    private lazy var coordinatesView: CoordinatesView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnCoordinatesView))
        let view = CoordinatesView()
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var altitudeView: AltitudeView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnCoordinatesView))
        let view = AltitudeView()
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private var descriptionView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomSaveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.titleLabel?.font = .ptSans22()
        button.setTitle("СОХРАНИТЬ", for: .normal)
        
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveButton = UIBarButtonItem(title: "Сохранить",
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapSaveButton))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        setDelegates()
        initializeHideKeyboard()
        
        let currentDate = calendarView.getDate()
        model.setDate(currentDate)
        
        updateCategoryButtons()
    }
    
    override func viewDidLayoutSubviews() {
        infoButton.layer.cornerRadius = infoButton.frame.height / 2
        bottomSaveButton.layer.cornerRadius = bottomSaveButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func didTapInfoButton() {
        print("🟢 didTapInfoButton in EditMountainPassVC")
    }
    
    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapOnCoordinatesView() {
        coordinatesModal.show(in: self, with: model.getCoordinates()) { [weak self] coordinates in
            self?.model.setCoordinates(coordinates)
            self?.updateCoordinates()
        }
    }
    
    @objc private func didTapSaveButton() {
        print("🟢 didTapSave in EditMountainPassVC")
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        title = "Редактирование перевала"
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textField)
        contentView.addSubview(infoButton)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(stackView1)
        contentView.addSubview(stackView2)
        contentView.addSubview(additionLabel)
        contentView.addSubview(additionStackView)
        contentView.addSubview(separatorView1)
        contentView.addSubview(dateLabel)
        contentView.addSubview(calendarView)
        contentView.addSubview(todayView)
        contentView.addSubview(coordintatesLabel)
        contentView.addSubview(separatorView2)
        contentView.addSubview(coordinatesView)
        contentView.addSubview(altitudeView)
        contentView.addSubview(descriptionView)
        contentView.addSubview(bottomSaveButton)
        
        updateCoordinates()
    }
    
    private func setDelegates() {
        
        textField.delegate = self
        
        for view in stackView1.arrangedSubviews {
            guard let button = view as? CategoryButton else { return }
            button.delegate = self
        }
        
        for view in stackView2.arrangedSubviews {
            guard let button = view as? CategoryButton else { return }
            button.delegate = self
        }
        
        for view in additionStackView.arrangedSubviews {
            guard let button = view as? AdditionButton else { return }
            button.delegate = self
        }
        
        calendarView.delegate = self
    }
    
    private func updateCategoryButtons() {
        
        var category = ""
        
        if let unwrCategory = model.getCategory() {
            category = unwrCategory
        }
        
        if model.isMarkedWithStar {
            category = category + "*"
        }
        
        print("🟢🟢🟢 Category: \(String(describing: category))")
        
        for view in stackView1.arrangedSubviews {
            guard let button = view as? CategoryButton else { return }
            let buttonTitle = button.getButtonTitle()
            button.isButtonWithStar = model.isMarkedWithStar
            button.isActive = buttonTitle == category
        }
        
        for view in stackView2.arrangedSubviews {
            guard let button = view as? CategoryButton else { return }
            let buttonTitle = button.getButtonTitle()
            button.isButtonWithStar = model.isMarkedWithStar
            button.isActive = buttonTitle == category
        }
    }
    
    private func updateAdditionButtons() {
        for view in additionStackView.arrangedSubviews {
            
            guard let button = view as? AdditionButton else { return }
            let buttonTitle = button.getButtonTitle()
            
            if buttonTitle == "*" {
                button.isActive = model.isMarkedWithStar
            }
            
            if buttonTitle == "не уверен" {
                button.isActive = model.isNotSureSelected
            }
            
            if buttonTitle == "оценочно" {
                button.isActive = model.isEstimatedSelected
            }
        }
    }
    
    private func updateCoordinates() {
        let coordinates = model.getCoordinates()
        coordinatesView.setLatitude(coordinates.latitude)
        coordinatesView.setLongitude(coordinates.longitude)
        altitudeView.setAltitude(coordinates.height)
    }
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - CategoryButtonDelegate
extension EditMountainPassVC: CategoryButtonDelegate {
    func didTapCategoryButton(with title: String) {
        print("🟢🟢 didTapCategoryButton with title \(title)")
        model.setCategory(title)
        updateCategoryButtons()
    }
}

// MARK: - AdditionButtonDelegate
extension EditMountainPassVC: AdditionButtonDelegate {
    
    func didTapAdditionButton(with title: String, status: Bool) {
        print("🟢🟢 didTapAdditionButton with title \(title)")
        
        if title == "*" {
            model.isMarkedWithStar = !status
            updateCategoryButtons()
        }
        
        if title == "не уверен" {
            model.isNotSureSelected = !status
        }
        
        if title == "оценочно" {
            model.isEstimatedSelected = !status
        }
        
        updateAdditionButtons()
    }
}

// MARK: - UITextFieldDelegate
extension EditMountainPassVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("🟢 textFieldDidEndEditing in EditMountainPassVC")
        
        model.setTitle(textField.text)
        
        print("🟢🟢 Text from model: \(model.getTitle())")
    }
}

// MARK: - CalendarViewDelegate
extension EditMountainPassVC: CalendarViewDelegate {
    func editingDidEndOnDatePicker(with date: String) {
        print("🟢🟢 editingDidEndOnDatePicker in EditMountainPassVC")
        model.setDate(date)
        
        print("🟢🟢🟢 Inserted to model date: \(model.getDate())")
    }
}


// MARK: - SetConstraints
extension EditMountainPassVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            infoButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalTo: infoButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: infoButton.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            stackView1.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            stackView1.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            stackView1.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 30),
            stackView2.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            stackView2.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            stackView2.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            additionLabel.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 20),
            additionLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            additionLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            additionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            additionStackView.topAnchor.constraint(equalTo: additionLabel.bottomAnchor, constant: 3),
            additionStackView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            additionStackView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            additionStackView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            separatorView1.topAnchor.constraint(equalTo: additionStackView.bottomAnchor),
            separatorView1.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: -25),
            separatorView1.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 25),
            separatorView1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            calendarView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            calendarView.widthAnchor.constraint(equalToConstant: 300),
            calendarView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            todayView.topAnchor.constraint(equalTo: calendarView.topAnchor),
            todayView.leadingAnchor.constraint(equalTo: calendarView.trailingAnchor, constant: 5),
            todayView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            todayView.heightAnchor.constraint(equalTo: calendarView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            coordintatesLabel.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 20),
            coordintatesLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            coordintatesLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            coordintatesLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            separatorView2.topAnchor.constraint(equalTo: coordintatesLabel.bottomAnchor, constant: 10),
            separatorView2.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: -25),
            separatorView2.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 25),
            separatorView2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            coordinatesView.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 15),
            coordinatesView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            coordinatesView.widthAnchor.constraint(equalToConstant: 200),
            coordinatesView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            altitudeView.topAnchor.constraint(equalTo: coordinatesView.topAnchor),
            altitudeView.leadingAnchor.constraint(equalTo: coordinatesView.trailingAnchor, constant: 25),
            altitudeView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            altitudeView.heightAnchor.constraint(equalTo: coordinatesView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: coordinatesView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        
        NSLayoutConstraint.activate([
            bottomSaveButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 15),
            bottomSaveButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomSaveButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomSaveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
