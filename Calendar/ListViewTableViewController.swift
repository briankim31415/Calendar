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

        data = [Event(name: "Bob", description: "Bob simply is...", date: time1)]
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
    
   
    

}