//
//  Event.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 4/25/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import Foundation

struct Event {
    var name: String
    var description: String
    var date: Time
    
    init(name : String, description : String, date : Time) {
        self.name = name
        self.description = description
        self.date = date
    }
    
}

struct Time {
    var day: Int
    var month: Int
    var year: Int
    var time: Int
    
    init(day : Int, month : Int, year : Int, time : Int) {
        self.day = day
        self.month = month
        self.year = year
        self.time = time
    }
}
