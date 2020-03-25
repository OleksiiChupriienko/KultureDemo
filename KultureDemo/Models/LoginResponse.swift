//
//  LoginResponse.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 24.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let key : String

    enum CodingKeys: String, CodingKey {

        case key = "key"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(String.self, forKey: .key)
    }

}
