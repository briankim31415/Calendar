//
//  Event.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 4/25/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import Foundation

class Event : Comparable, CustomStringConvertible {
    var name: String
    var itemDescription: String
    var date: Time
    
    var description : String {
        return name
    }
    
    init(name : String, description : String, date : Time) {
        self.name = name
        self.itemDescription = description
        self.date = date
    }
    
    static func == (event1: Event, event2: Event) -> Bool {
        if event1.date.year == event2.date.year && event1.date.day == event2.date.day && event1.date.month == event2.date.month && event1.date.time == event2.date.time {
            return true
        }
        return false
    }
    
    static func < (event1: Event, event2: Event) -> Bool {
        
        //If event1 year < event2 year, event1 is earlier
        if event1.date.year < event2.date.year {
            return true
        }
        
        //If they are the same, follow the same logic for month, day, time
        if event1.date.year == event2.date.year {
            if event1.date.month < event2.date.month {
                return true
            }
            if event1.date.month == event2.date.month {
                if event1.date.day < event2.date.day {
                    return true
                }
                if event1.date.day == event2.date.day {
                    if event1.date.time < event2.date.time {
                        return true
                    }
                    //If the time is greater or equal to then return false
                    return false
                }
                return false
            }
            
            return false
        }
        
        return false
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
