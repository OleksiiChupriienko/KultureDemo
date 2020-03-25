//
//  Prices.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct Prices: Codable {
    
    let id: Int?
    let name: String?
    let count: Int?
    let price: Int?
    let expirationDays: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case count = "count"
        case price = "price"
        case expirationDays = "expiration_days"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        expirationDays = try values.decodeIfPresent(Int.self, forKey: .expirationDays)
    }
}
