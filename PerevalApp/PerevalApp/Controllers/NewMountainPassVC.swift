import UIKit

class NewMountainPassVC: UIViewController {
    
    // MARK: - Properties
    private let apiService = APIService()
    
    private var category: String?
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 200)
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
    private let coordinatesView = CoordinatesView()
    private let altitudeView = AltitudeView()
    
    private let photoLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSans22()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Фото"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let attachPhotoView = AttachPhotoView()
    
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
        print("🟢 didTapInfoButton in NewMountainPassVC")
        
        sendNewPostRequest()
    }
    
    @objc private func didTapCategoryButton() {
        print("🟢 didTapCategoryButton in NewMountainPassVC")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
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
        contentView.addSubview(photoLabel)
        contentView.addSubview(attachPhotoView)
    }
    
    /*
    private func provideMountainPassDataToAPIService() {
        
        //        guard let title = textField.text,
        //              !title.isEmpty else {
        //            print("🔴 Providing data is stopped, due Title is Nil")
        //            return
        //        }
        
        let title = "перевал ЛохНесс"
        
        let date = calendarView.getDate()
        
        let coordinates = Coords(latitude: "45.3842",
                                 longitude: "7.1525",
                                 height: "1200")
        
        category = "A2*"
        guard let category = self.category else {
            print("🔴 Providing data is stopped, due Category is Nil")
            return
        }
        
        let image1 = Image(url: "http://...1",
                           title: "Подъём. Фото №1")
        let image2 = Image(url: "http://...2",
                           title: "Подъём. Фото №2")
        let image3 = Image(url: "http://...3",
                           title: "Подъём. Фото №3")
        let images = [image1, image2, image3]
        
        guard let currentUser = UserSettings.currentUser else {
            print("🔴 Providing data is stopped, due CurrentUser is Nil")
            return
        }
        let user = User(id: 888,
                        email: currentUser.email,
                        phone: currentUser.phone,
                        fam: currentUser.surname,
                        name: currentUser.name)
        
        apiService.postMountainPass(title: title,
                                    date: date,
                                    user: user,
                                    coordinates: coordinates,
                                    category: category,
                                    images: images)
    }
    */
    
    private func sendNewPostRequest() {
        
        guard let title = textField.text,
              !title.isEmpty else {
            print("🔴 Providing data is stopped, due Title is Nil")
            return
        }
        
        let date = calendarView.getDate()
        
        guard let currentUser = UserSettings.currentUser else {
            print("🔴 Providing data is stopped, due CurrentUser is Nil")
            return
        }
        let user = User(id: 888,
                        email: currentUser.email,
                        phone: currentUser.phone,
                        fam: currentUser.surname,
                        name: currentUser.name)
        
        apiService.newTestPostMountainPass(title: title,
                                           date: date,
                                           user: user)
    }
}

// MARK: - SetConstraints
extension NewMountainPassVC {
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
            photoLabel.topAnchor.constraint(equalTo: coordinatesView.bottomAnchor, constant: 20),
            photoLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            photoLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            photoLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            attachPhotoView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 20),
            attachPhotoView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            attachPhotoView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            attachPhotoView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}
