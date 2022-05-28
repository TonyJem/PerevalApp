import Foundation

class Mountain {
    // MARK: - Properties
    var isSelected: Bool
    var name: String
    var message: String
    var status: Status
    
    var images: [Image] = []
    
    private var goUpImages: [[Photo]] = [[],[],[]]          // [["Подъём"], ["Перевальный взлёт"], ["Середина подъёма"]]
    private var passPointImages: [[Photo]] = [[],[],[],[]]  // [["Седловина"], ["Тур"], ["Записка"], ["Группа на перевале"]
    private var goDownImages: [[Photo]] = [[],[],[]]        // [["Спуск"], ["Перевальный взлёт (обратно)"], ["Середина спуска"]]
    
    // MARK: - Init
    init(isSelected: Bool = false,
         name: String,
         message: String,
         status: Status = Status(type: .template,
                                 lastUpdateDate: nil,
                                 message: nil)) {
        self.isSelected = isSelected
        self.name = name
        self.message = message
        self.status = status
    }
    
    // MARK: - Public Methods
    func setPhoto(photo: Photo) {
        print("🟠 Will set photoIndex: \(photo.index)")
        switch photo.index {
        case 0:
            goUpImages[0].append(photo) // ["Подъём"]
        case 1:
            goUpImages[1].append(photo) // ["Перевальный взлёт"]
        case 2:
            goUpImages[2].append(photo) // ["Середина подъёма"]
        case 3:
            passPointImages[0].append(photo) // ["Седловина"]
        case 4:
            passPointImages[1].append(photo) // ["Тур"]
        case 5:
            passPointImages[2].append(photo) // ["Записка"]
        case 6:
            passPointImages[3].append(photo) // ["Группа на перевале"]
        case 7:
            goDownImages[0].append(photo) // ["Спуск"]
        case 8:
            goDownImages[1].append(photo) // ["Перевальный взлёт (обратно)"]
        case 9:
            goDownImages[2].append(photo) // ["Середина спуска"]
        default:
            break
        }
    }
}

// MARK: - Status
struct Status {
    enum StatusType {
        case template       // черновик или тот, что уже готово, но ни разу не пробовали высылать
        case new            // находящийся в очереди на отправку
        case pending        // принято - если модератор взял в работу
        case accepted       // опубликовано - resolved с сообщением
        case rejected       // отклонено - resolved с сообщением
    }
    
    // MARK: - Properties
    var type: StatusType
    var lastUpdateDate: String?
    var message: String?
}

// MARK: - Photo
struct Photo {
    var index: Int
    var url: String
    var title: String
}

// MARK: - MountainModel
class MountainModel {
    // MARK: - Mock Data:
    private var mountain0 = Mountain(isSelected: false,
                             name: "Mountain0",
                             message: "2020-09-01")
    
    private var mountain1 = Mountain(isSelected: false,
                             name: "Mountain1",
                             message: "2020-09-01")
    
    private var mountain2 = Mountain(isSelected: false,
                             name: "Mountain2",
                             message: "2020-09-01")
    
    private var mountain3 = Mountain(isSelected: false,
                             name: "Mountain3",
                             message: "2020-09-01")
    
    private var mountain4 = Mountain(isSelected: false,
                             name: "Mountain4",
                             message: "2020-09-01")
    
    private var mountain5 = Mountain(isSelected: false,
                             name: "Mountain5",
                             message: "2020-09-01")
    
    private var mountain6 = Mountain(isSelected: false,
                             name: "Mountain6",
                             message: "2020-09-01")
    
    private var mountain7 = Mountain(isSelected: false,
                             name: "Mountain7",
                             message: "2020-09-01")
    
    private var mountain8 = Mountain(isSelected: false,
                             name: "Mountain8",
                             message: "2020-09-01")
    
    private var mountain9 = Mountain(isSelected: false,
                             name: "Mountain9",
                             message: "2020-09-01")
    
    private var mountain10 = Mountain(isSelected: false,
                             name: "Mountain10",
                             message: "2020-09-01")
    
    private var mountain11 = Mountain(isSelected: false,
                             name: "Mountain11",
                             message: "2020-09-01")
    
    private var mountain12 = Mountain(isSelected: false,
                             name: "Mountain12",
                             message: "2020-09-01")
    
    // MARK: - Properties
    var mountains: [Mountain] = []
    
    var selectedMountains: [Mountain] {
        return mountains.filter { $0.isSelected == true }
    }
    
    // MARK: - Init
    init(mountains: [Mountain] = []) {
        self.mountains = mountains
        
        self.mountains.append(mountain0)
        self.mountains.append(mountain1)
        self.mountains.append(mountain2)
        self.mountains.append(mountain3)
        self.mountains.append(mountain4)
        self.mountains.append(mountain5)
        self.mountains.append(mountain6)
        self.mountains.append(mountain7)
        self.mountains.append(mountain8)
        self.mountains.append(mountain9)
        self.mountains.append(mountain10)
        self.mountains.append(mountain11)
        self.mountains.append(mountain12)
    }
    
    // MARK: - Public Methods
    func setSelectionFor(item: Int, isSelected: Bool) {
        mountains[item].isSelected = isSelected
    }
    
    func removeAllSelections() {
        selectedMountains.forEach { $0.isSelected = false }
    }
}
