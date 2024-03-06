//
//  NotificationModel.swift
//  Englease
//
//  Created by Kareem on 06/03/2024.
//

import Foundation

struct NotificationData: Codable {
    let notificationType: String
    let visitId: String

    enum CodingKeys: String, CodingKey {
        case visitId = "visit_id"
        case notificationType = "notification_type"
    }
}
