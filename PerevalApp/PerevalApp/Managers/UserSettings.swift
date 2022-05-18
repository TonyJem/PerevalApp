import Foundation

struct UserSettings {
    
    private enum SettingsKeys: String {
        case userSurname
        case userName
        case userPatronymic
        case userEmail
        case userPhone
        case userMediaLink
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
}
