//
//  ClassPhotos.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct ClassPhoto : Codable {
    let id: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
}
