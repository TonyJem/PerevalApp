import Foundation

struct UserDefaultsManager {
    
    private enum UserDefaultsManagerKey {
        static let currentAccount = "CurrentAccount"
    }
    
    private static var userDefaults: UserDefaults {
        UserDefaults.standard
    }
    
    static var currentAccount: User? {
        get {
            guard let currentAccount = userDefaults.object(forKey: UserDefaultsManagerKey.currentAccount) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(User.self, from: currentAccount)
        } set {
            let currentAccount = try? JSONEncoder().encode(newValue)
            userDefaults.set(currentAccount, forKey: UserDefaultsManagerKey.currentAccount)
        }
    }
    
    static func saveUser(_ user: User) {
        currentAccount = user
    }
}
