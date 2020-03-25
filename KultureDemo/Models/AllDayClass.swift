//
//  AllDayClass.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import Foundation

typealias AllDayClasses = [AllDayClass]

struct AllDayClass : Codable {
    let id : Int?
    let date : String
    let startTime : String
    let endTime : String?
    let vipStartDate : String?
    let vipFinishDate : String?
    let isVip : Bool?
    let isValidVip : Bool?
    let isRobinsonVip : Bool?
    let isValidRobinsonVip : Bool?
    let robinsonVipStartDate : String?
    let robinsonVipFinishDate : String?
    let isWeeklyTrial : Bool?
    let isValidWeeklyTrial : Bool?
    let weeklyTrialStartDate : String?
    let weeklyTrialFinishDate : String?
    let isCanReserveForFree : Bool?
    let classes : Classes
    let reservedPositionsCount : Int?
    let isUnderCancelDeadline : Bool?
    let deadlineDate : String?
    let isNewUser : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case date = "date"
        case startTime = "start_time"
        case endTime = "end_time"
        case vipStartDate = "vip_start_date"
        case vipFinishDate = "vip_finish_date"
        case isVip = "is_vip"
        case isValidVip = "is_valid_vip"
        case isRobinsonVip = "is_robinson_vip"
        case isValidRobinsonVip = "is_valid_robinson_vip"
        case robinsonVipStartDate = "robinson_vip_start_date"
        case robinsonVipFinishDate = "robinson_vip_finish_date"
        case isWeeklyTrial = "is_weekly_trial"
        case isValidWeeklyTrial = "is_valid_weekly_trial"
        case weeklyTrialStartDate = "weekly_trial_start_date"
        case weeklyTrialFinishDate = "weekly_trial_finish_date"
        case isCanReserveForFree = "is_can_reserve_for_free"
        case classes = "classes"
        case reservedPositionsCount = "reserved_positions_count"
        case isUnderCancelDeadline = "is_under_cancel_deadline"
        case deadlineDate = "deadline_date"
        case isNewUser = "is_new_user"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        date = try values.decode(String.self, forKey: .date)
        startTime = try values.decode(String.self, forKey: .startTime)
        endTime = try values.decodeIfPresent(String.self, forKey: .endTime)
        vipStartDate = try values.decodeIfPresent(String.self, forKey: .vipStartDate)
        vipFinishDate = try values.decodeIfPresent(String.self, forKey: .vipFinishDate)
        isVip = try values.decodeIfPresent(Bool.self, forKey: .isVip)
        isValidVip = try values.decodeIfPresent(Bool.self, forKey: .isValidVip)
        isRobinsonVip = try values.decodeIfPresent(Bool.self, forKey: .isRobinsonVip)
        isValidRobinsonVip = try values.decodeIfPresent(Bool.self, forKey: .isValidRobinsonVip)
        robinsonVipStartDate = try values.decodeIfPresent(String.self, forKey: .robinsonVipStartDate)
        robinsonVipFinishDate = try values.decodeIfPresent(String.self, forKey: .robinsonVipFinishDate)
        isWeeklyTrial = try values.decodeIfPresent(Bool.self, forKey: .isWeeklyTrial)
        isValidWeeklyTrial = try values.decodeIfPresent(Bool.self, forKey: .isValidWeeklyTrial)
        weeklyTrialStartDate = try values.decodeIfPresent(String.self, forKey: .weeklyTrialStartDate)
        weeklyTrialFinishDate = try values.decodeIfPresent(String.self, forKey: .weeklyTrialFinishDate)
        isCanReserveForFree = try values.decodeIfPresent(Bool.self, forKey: .isCanReserveForFree)
        classes = try values.decode(Classes.self, forKey: .classes)
        reservedPositionsCount = try values.decodeIfPresent(Int.self, forKey: .reservedPositionsCount)
        isUnderCancelDeadline = try values.decodeIfPresent(Bool.self, forKey: .isUnderCancelDeadline)
        deadlineDate = try values.decodeIfPresent(String.self, forKey: .deadlineDate)
        isNewUser = try values.decodeIfPresent(Bool.self, forKey: .isNewUser)
    }
}
