import Foundation

class Mountain {
    // MARK: - Properties
    var isSelected: Bool
    var title: String
    var message: String
    var status: Status
    
    private var goUpPhotos: [[Photo]] = [[],[],[]]          // [["Подъём"], ["Перевальный взлёт"], ["Середина подъёма"]]
    private var passPointPhotos: [[Photo]] = [[],[],[],[]]  // [["Седловина"], ["Тур"], ["Записка"], ["Группа на перевале"]
    private var goDownPhotos: [[Photo]] = [[],[],[]]        // [["Спуск"], ["Перевальный взлёт (обратно)"], ["Середина спуска"]]
    
    var statisticText: String {
        return "\(goUpPhotosCountText) \(passPointPhotosCountText) \(goDownPhotosCountText)"
    }
    
    var photosCount: Int {
        var count = 0
        goUpPhotos.forEach { count += $0.count }
        passPointPhotos.forEach { count += $0.count }
        goDownPhotos.forEach { count += $0.count }
        return count
    }
    
    private var goUpPhotosCountText: String {
        var count = 0
        goUpPhotos.forEach { count += $0.count }
        let text = "Подъём \(count)/\(goUpPhotos.count)"
        return text
    }
    
    private var passPointPhotosCountText: String {
        var count = 0
        passPointPhotos.forEach { count += $0.count }
        let text = "Седловина \(count)/\(passPointPhotos.count)"
        return text
    }
    
    private var goDownPhotosCountText: String {
        var count = 0
        goDownPhotos.forEach { count += $0.count }
        let text = "Спуск \(count)/\(goDownPhotos.count)"
        return text
    }
    
    
    // MARK: - Init
    init(isSelected: Bool = false,
         title: String,
         message: String,
         status: Status = Status(type: .template,
                                 lastUpdateDate: nil,
                                 message: nil)) {
        self.isSelected = isSelected
        self.title = title
        self.message = message
        self.status = status
    }
    
    // MARK: - Public Methods
    func setPhoto(photo: Photo) {
        print("🟠 Will set photoIndex: \(photo.index)")
        switch photo.index {
        case 0:
            goUpPhotos[0].append(photo) // ["Подъём"]
        case 1:
            goUpPhotos[1].append(photo) // ["Перевальный взлёт"]
        case 2:
            goUpPhotos[2].append(photo) // ["Середина подъёма"]
        case 3:
            passPointPhotos[0].append(photo) // ["Седловина"]
        case 4:
            passPointPhotos[1].append(photo) // ["Тур"]
        case 5:
            passPointPhotos[2].append(photo) // ["Записка"]
        case 6:
            passPointPhotos[3].append(photo) // ["Группа на перевале"]
        case 7:
            goDownPhotos[0].append(photo) // ["Спуск"]
        case 8:
            goDownPhotos[1].append(photo) // ["Перевальный взлёт (обратно)"]
        case 9:
            goDownPhotos[2].append(photo) // ["Середина спуска"]
        default:
            break
        }
    }
    
    func getCountFor(section: Int, row: Int) -> Int {
        switch section {
        case 0:
            return goUpPhotos[row].count
        case 1:
            return passPointPhotos[row].count
        case 2:
            return goDownPhotos[row].count
        default:
            return 0
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
                                     title: "Mountain0",
                                     message: "2020-09-01")
    
    private var mountain1 = Mountain(isSelected: false,
                                     title: "Mountain1",
                                     message: "2020-09-01")
    
    private var mountain2 = Mountain(isSelected: false,
                                     title: "Mountain2",
                                     message: "2020-09-01")
    
    private var mountain3 = Mountain(isSelected: false,
                                     title: "Mountain3",
                                     message: "2020-09-01")
    
    private var mountain4 = Mountain(isSelected: false,
                                     title: "Mountain4",
                                     message: "2020-09-01")
    
    private var mountain5 = Mountain(isSelected: false,
                                     title: "Mountain5",
                                     message: "2020-09-01")
    
    private var mountain6 = Mountain(isSelected: false,
                                     title: "Mountain6",
                                     message: "2020-09-01")
    
    private var mountain7 = Mountain(isSelected: false,
                                     title: "Mountain7",
                                     message: "2020-09-01")
    
    private var mountain8 = Mountain(isSelected: false,
                                     title: "Mountain8",
                                     message: "2020-09-01")
    
    private var mountain9 = Mountain(isSelected: false,
                                     title: "Mountain9",
                                     message: "2020-09-01")
    
    private var mountain10 = Mountain(isSelected: false,
                                      title: "Mountain10",
                                      message: "2020-09-01")
    
    private var mountain11 = Mountain(isSelected: false,
                                      title: "Mountain11",
                                      message: "2020-09-01")
    
    private var mountain12 = Mountain(isSelected: false,
                                      title: "Mountain12",
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
