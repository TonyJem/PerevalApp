import Foundation

struct UserModel: Codable {
    
    var surname: String
    var name: String
    var patronymic: String
    var email: String
    var phone: String?
    var mediaLink: String?
    
    init(surname: String,
         name: String,
         patronymic: String,
         email: String,
         phone: String?,
         mediaLink: String?) {
        self.surname = surname
        self.name = name
        self.patronymic = patronymic
        self.email = email
        self.phone = phone
        self.mediaLink = mediaLink
    }
}
