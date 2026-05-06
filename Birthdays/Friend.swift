//
//  Friend.swift
//  Birthdays
//
//  Created by Lidiia Diachkovskaia on 5/6/26.
//

import Foundation
import SwiftData

@Model //SwiftData gives you access to @Model macro
class Friend {   //for swiftdata you need a class not struct, classes have a built-in identity that instances of structs don't have
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
