//
//  model2.swift
//  homework2
//
//  Created by Berkay on 9.01.2023.
//

import Foundation

struct Lover: Codable {
    let pagination: Pagination?
    let dataa: [Datumm]?
}

// MARK: - Datum
struct Datumm: Codable {
    let malID: Int?
    let url: String?
    let images: Images?
    let name, nameKanji: String?
    let nicknames: [String]?
    let favorites: Int?
    let about: String?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, name
        case nameKanji = "name_kanji"
        case nicknames, favorites, about
    }
}

// MARK: - Images
struct Images: Codable {
    let jpg: Jpg?
    let webp: Webp?
}

// MARK: - Jpg
struct Jpg: Codable {
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

// MARK: - Webp
struct Webp: Codable {
    let imageURL, smallImageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let lastVisiblePage: Int?
    let hasNextPage: Bool?
    let currentPage: Int?
    let items: Items?

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
        case items
    }
}

// MARK: - Items
struct Items: Codable {
    let count, total, perPage: Int?

    enum CodingKeys: String, CodingKey {
        case count, total
        case perPage = "per_page"
    }
}
