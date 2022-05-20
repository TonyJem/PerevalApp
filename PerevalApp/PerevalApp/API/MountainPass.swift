import Foundation

struct MountainPass: Codable {
    let beautyTitle: String
    var title: String
    let otherTitles: String
    let connect: String
    var addTime: String
    var user: User
    var coords: Coords
    let type: String
    var level: Level
    var images: [Image]

    enum CodingKeys: String, CodingKey {
        case beautyTitle
        case title
        case otherTitles = "other_titles"
        case connect
        case addTime = "add_time"
        case user
        case coords
        case type
        case level
        case images
    }
}

// MARK: - Coords
struct Coords: Codable {
    var latitude: String
    var longitude: String
    var height: String
}

// MARK: - Image
struct Image: Codable {
    var url: String
    var title: String
}

// MARK: - Level
struct Level: Codable {
    let winter: String
    var summer: String
    var autumn: String
    let spring: String
}

// MARK: - User
struct User: Codable {
    let id: Int
    var email: String
    var phone: String
    var fam: String
    var name: String
}
