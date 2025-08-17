//
//  Date.swift
//  TraumJobs
//
//  Created by Jeff Braun on 17.08.25.
//

import Foundation

extension Date {
    var endOfDay: Date {
        Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self) ?? self
    }
}
