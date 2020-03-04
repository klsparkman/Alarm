//
//  Alarm.swift
//  Alarm
//
//  Created by Kelsey Sparkman on 3/2/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation

class Alarm: Codable {
    var date: Date
    var name: String
    var enabled: Bool
    var uuid: String = UUID().uuidString
    
    var fireTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter.string(from: date)
    }

    init(date: Date, name: String, enabled: Bool) {
        self.date = date
        self.name = name
        self.enabled = enabled
    }
}//End of class

extension Alarm: Equatable {
    static func ==(lhs: Alarm, rhs: Alarm) -> Bool {
        return lhs.date == rhs.date && lhs.name == rhs.name && lhs.enabled == rhs.enabled
    }
}
