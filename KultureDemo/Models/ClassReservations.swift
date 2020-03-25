//
//  ClassReservations.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

struct Class_reservations : Codable {
    let id: Int?
    let user: User?
    let trialUser: String?
    let position: Int?
    let attended: String?
    let notes: String?
    let trialPosition: String?
    let creationDate: String?
    let qrCodeUrl: String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user = "user"
        case trialUser = "trial_user"
        case position = "position"
        case attended = "attended"
        case notes = "notes"
        case trialPosition = "trial_position"
        case creationDate = "creation_date"
        case qrCodeUrl = "qr_code_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        trialUser = try values.decodeIfPresent(String.self, forKey: .trialUser)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        attended = try values.decodeIfPresent(String.self, forKey: .attended)
        notes = try values.decodeIfPresent(String.self, forKey: .notes)
        trialPosition = try values.decodeIfPresent(String.self, forKey: .trialPosition)
        creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate)
        qrCodeUrl = try values.decodeIfPresent(String.self, forKey: .qrCodeUrl)
    }

}
