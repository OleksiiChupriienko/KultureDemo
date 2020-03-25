//
//  Teacher.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct Teacher : Codable {
    let id: Int?
    let name: String
    let phoneNumber: String?
    let email: String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case phoneNumber = "phone_number"
        case email = "email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }

}
