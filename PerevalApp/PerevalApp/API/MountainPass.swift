import Foundation

struct MountainPass: Codable {
    let beautyTitle: String
    let title: String
    let otherTitles: String
    let connect: String
    let addTime: String
    let user: User
    let coords: Coords
    let type: String
    let level: Level
    let images: [Image]

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
    let latitude: String
    let longitude: String
    let height: String
}

// MARK: - Image
struct Image: Codable {
    let url: String
    let title: String
}

// MARK: - Level
struct Level: Codable {
    let winter: String
    let summer: String
    let autumn: String
    let spring: String
}

// MARK: - User
struct User: Codable {
    let id: Int
    let email: String
    let phone: String
    let fam: String
    let name: String
}
