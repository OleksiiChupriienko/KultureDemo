//
//  Decodable+Extension.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 24.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(fromData data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
