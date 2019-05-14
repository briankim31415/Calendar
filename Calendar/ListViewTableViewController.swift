//
//  ListViewTableViewController.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 4/23/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit
import UserNotifications

class ListViewTableViewController: UITableViewController{

    var data: [Event] = []
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time1 = Time(day: 21, month: 05, year: 2001, time: 2300)
        let event1 = Event(name: "Bob", description: "Bob simply is...", date: time1)
        let time2 = Time(day: 05, month: 02, year: 1984, time: 0800)
        let event2 = Event(name: "1984", description: "George Orwell", date: time2)
        let time3 = Time(day: 21, month: 05, year: 2001, time: 2350)
        let event3 = Event(name: "New Bob", description: "New Bob simply is...", date: time3)

        data = [event1, event2, event3]
        sortAndReloadData()
        print(data)
        navigationItem.leftBarButtonItem = editButtonItem
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
        
    }
    
    func sortAndReloadData() {
        data.sort()
        tableView.reloadData()
    }

    
    @objc func registerLocal()
    {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
            print("Permission granted")
        }
        else {
            print("Permission not granted")
        }
            
        }
    }
    
    @objc func scheduleLocal()
    {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Testing" //title of alert
        content.body = "Insert body" //main text
        content.categoryIdentifier = "Alarm" //custom action
        content.userInfo = ["CustomData": "Testing"] //just custom data
        content.sound = .default //sound property
        
        
        var dateComponent = DateComponents()
        dateComponent.hour = 14
        dateComponent.minute = 22
        //this one is the real calendar
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        //this one is for immediate testing with time delay by 5 seconds
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarID", for: indexPath) as! EventTableViewCell
        let content = data[indexPath.row]
        cell.update(with: content)
        //cell.textLabel?.text = content.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func unwindToCalendarTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddEditEventTableViewController
        
        if let event = sourceViewController.event {
            data.append(event)
            sortAndReloadData()
        }
    }
}
