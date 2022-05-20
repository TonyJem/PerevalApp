import Foundation

struct MountainPassModel {
    var title: String
    var date: String
    
    mutating func setupTitle(_ title: String) {
        self.title = title
    }
    
    mutating func setupDate(_ date: String) {
        self.date = date
    }
}

// MARK: - Coords
struct MountainPassCoordinates {
    var latitude: String
    var longitude: String
    var height: String
}

// MARK: - Image
struct MountainPassImage {
    var url: String
    var title: String
}

// MARK: - Level
struct MountainPassCategory {
    var summer: String
    var autumn: String
}

// MARK: - User
struct MountainPassUser {
    var email: String
    var phone: String
    var fam: String
    var name: String
}
