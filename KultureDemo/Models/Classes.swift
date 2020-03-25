//
//  Classes.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct Classes : Codable {
    let id : Int?
    let name : String
    let type : String?
    let prices : [Prices]?
    let teacher : Teacher
    let levelOfDifficulty : Int?
    let info : String?
    let classPhotos : [ClassPhoto]?
    let studio : Studio?
    let maxUsersCount : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case type = "type"
        case prices = "prices"
        case teacher = "teacher"
        case levelOfDifficulty = "level_of_difficulty"
        case info = "info"
        case classPhotos = "class_photos"
        case studio = "studio"
        case maxUsersCount = "max_users_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        prices = try values.decodeIfPresent([Prices].self, forKey: .prices)
        teacher = try values.decode(Teacher.self, forKey: .teacher)
        levelOfDifficulty = try values.decodeIfPresent(Int.self, forKey: .levelOfDifficulty)
        info = try values.decodeIfPresent(String.self, forKey: .info)
        classPhotos = try values.decodeIfPresent([ClassPhoto].self, forKey: .classPhotos)
        studio = try values.decodeIfPresent(Studio.self, forKey: .studio)
        maxUsersCount = try values.decodeIfPresent(Int.self, forKey: .maxUsersCount)
    }

}
