import Foundation

struct UserSettings {
    
    private enum SettingsKeys: String {
        case userSurname
        case userName
        case userPatronymic
        case userEmail
        case userPhone
        case userMediaLink
        case currentUser
    }
    
    private static var userDefaults: UserDefaults {
        UserDefaults.standard
    }
    
    static var userSurname: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userSurname.rawValue)
        } set {
            let key = SettingsKeys.userSurname.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    static var userName: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let key = SettingsKeys.userName.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    static var userPatronymic: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userPatronymic.rawValue)
        } set {
            let key = SettingsKeys.userPatronymic.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    static var userEmail: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userEmail.rawValue)
        } set {
            let key = SettingsKeys.userEmail.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    static var userPhone: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userPhone.rawValue)
        } set {
            let key = SettingsKeys.userPhone.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    static var userMediaLink: String? {
        get {
            return userDefaults.string(forKey: SettingsKeys.userMediaLink.rawValue)
        } set {
            let key = SettingsKeys.userMediaLink.rawValue
            set(newValue: newValue, for: key)
        }
    }
    
    private static func set(newValue: String?, for key: String) {
        if let newValue = newValue {
            print("Value: \(newValue) was added to key \(key)")
            userDefaults.set(newValue, forKey: key)
        } else {
            userDefaults.removeObject(forKey: key)
        }
    }
    
    static var currentUser: UserModel? {
        get {
            guard let currentUser = userDefaults.object(forKey: SettingsKeys.currentUser.rawValue) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(UserModel.self, from: currentUser)
        } set {
            if let currentUser = try? JSONEncoder().encode(newValue) {
                userDefaults.set(currentUser, forKey: SettingsKeys.currentUser.rawValue)
            } else {
                userDefaults.removeObject(forKey: SettingsKeys.currentUser.rawValue)
            }
        }
    }
}

// MARK: - Public methods
extension UserSettings {
    
    static func saveUser() {
        guard let surname = UserSettings.userSurname,
              let name = UserSettings.userName,
              let patronymic = UserSettings.userPatronymic,
              let email = UserSettings.userEmail else {
            return
        }
        
        UserSettings.currentUser = UserModel(surname: surname,
                                        name: name,
                                        patronymic: patronymic,
                                        email: email,
                                        phone: UserSettings.userPhone,
                                        mediaLink: UserSettings.userMediaLink)
    }
    
    static func removeUser() {
        UserSettings.currentUser = nil
    }
}
