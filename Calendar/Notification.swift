//
//  Notification.swift
//  Calendar
//
//  Created by Deehamhae, Papitchaya on 5/6/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import Foundation
import UserNotifications

class Notification: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], {didAllow, error in})
    }
}
