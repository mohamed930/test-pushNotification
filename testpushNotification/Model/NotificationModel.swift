//
//  NotificationModel.swift
//  Englease
//
//  Created by Kareem on 06/03/2024.
//

import Foundation

struct NotificationData: Codable {
    let visitType: String
    let time: String

    enum CodingKeys: String, CodingKey {
        case visitType = "visit_type" 
        case time
    }
}
