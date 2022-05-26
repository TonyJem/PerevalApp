import Foundation

enum StatusType {
    case template       // черновик или тот, что уже готово, но ни разу не пробовали высылать
    case new            // находящийся в очереди на отправку
    case pending        // принято - если модератор взял в работу
    case accepted       // опубликовано - resolved с сообщением
    case rejected       // отклонено - resolved с сообщением
}

struct Mountain {
    var isSelected: Bool
    var name: String
    var upPictureCount: Int
    var middlePictureCount: Int
    var downPictureCount: Int
    var message: String
    var status: Status
    
    init(isSelected: Bool = false,
         name: String,
         upPictureCount: Int = 0,
         middlePictureCount: Int = 0,
         downPictureCount: Int = 0,
         message: String,
         status: Status = Status(type: .template,
                                 lastUpdateDate: nil,
                                 message: nil)) {
        self.isSelected = isSelected
        self.name = name
        self.upPictureCount = upPictureCount
        self.middlePictureCount = middlePictureCount
        self.downPictureCount = downPictureCount
        self.message = message
        self.status = status
    }
}

struct Status {
    var type: StatusType
    var lastUpdateDate: String?
    var message: String?
}

class MountainModel {
    
    var mountain0 = Mountain(isSelected: false,
                             name: "Mountain0",
                             upPictureCount: 0,
                             middlePictureCount: 0,
                             downPictureCount: 0,
                             message: "2020-09-01")
}
