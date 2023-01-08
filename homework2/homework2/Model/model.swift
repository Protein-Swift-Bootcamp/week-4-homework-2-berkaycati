import Foundation

struct Genre: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let malID: Int?
    let name: String?
    let url: String?
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case name, url, count
    }
}
