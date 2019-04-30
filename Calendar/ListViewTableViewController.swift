//
//  ListViewTableViewController.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 4/23/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit

class ListViewTableViewController: UITableViewController {
    
    var data: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time1  = Time(day: 21, month: 05, year: 2001, time: 2300)
        let event1 = Event(name: "2001", description: "Bob simply is...", date: time1)
        let time2  = Time(day: 05, month: 02, year: 1984, time: 0800)
        let event2 = Event(name: "1984", description: "George Orwell", date: time2)
        let time3  = Time(day: 03, month: 03, year: 2005, time: 2100)
        let event3 = Event(name: "2005", description: "The one time in history that it was April 3rd 2005", date: time3)
        let time4  = Time(day: 03, month: 04, year: 2005, time: 2100)
        let event4 = Event(name: "2005e", description: "The 2005 early bird special", date: time4)

        data = [event3, event1, event2, event4]
        data.sort()
        print(data)
        navigationItem.leftBarButtonItem = editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarID", for: indexPath)
        let content = data[indexPath.row]
        cell.textLabel?.text = content.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
