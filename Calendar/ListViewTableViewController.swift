//
//  ListViewTableViewController.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 4/23/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit
import UserNotifications

class ListViewTableViewController: UITableViewController {
    
    var data: [Event] = []
    var edittingEventIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
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
    }
    
    func sortAndReloadData() {
        data.sort()
        tableView.reloadData()
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
        if let sourceViewController = segue.source as? AddEditEventTableViewController{
            if let event = sourceViewController.event {
                data.append(event)
                sortAndReloadData()
            }
        }
        
        if let sourceViewController = segue.source as? EditEventTableViewController {
            if let event = sourceViewController.event {
                data[(edittingEventIndexPath?.row)!] = event
                sortAndReloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? EditEventTableViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == "EditEvent" {
            edittingEventIndexPath = indexPath
            destination.event = data[indexPath.row]
        }
    }
}
