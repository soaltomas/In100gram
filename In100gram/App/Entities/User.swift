import Foundation

struct User: Codable {
    let id: String
    let name: String
    let avatarURL: String?
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "username"
        case avatarURL = "profile_picture"
        case fullName = "full_name"
    }

}

