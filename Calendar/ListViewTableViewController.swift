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
        
        let time1 = Time(day: 21, month: 05, year: 2001, time: 2300)
        let event1 = Event(name: "Bob", description: "Bob simply is...", date: time1)
        let time2 = Time(day: 05, month: 02, year: 1984, time: 0800)
        let event2 = Event(name: "1984", description: "George Orwell", date: time2)

        data = [event1, event2]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem = editButtonItem
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
        cell.textLabel?.text = content
        cell.showsReorderControl = true
        return cell
    }
    
        cell.textLabel?.text = content.name
        cell.detailTextLabel?.text = content.description
        cell.textLabel?.text = content
        cell.showsReorderControl = true
            print("Deleted")
            
            self.data.remove(at: indexPath.row)
   
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //The random list of strings that the table is displaying as a test
    let data = ["Hello", "Goodbye", "Watch"]
    

}
