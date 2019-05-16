//
//  AddEditEventTableViewController.swift
//  Calendar
//
//  Created by Kim, Brian M on 5/10/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit
import UserNotifications

class AddEditEventTableViewController: UITableViewController {

    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventDescriptionTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For editing existing event
        /*if let event = event {
            eventNameTextField.text = event.name
            eventDescriptionTextField.text = event.itemDescription
            
            let dayInt: Int = Int(dayTextField.text ?? "0")!
            let monthInt: Int = Int(monthTextField.text ?? "0")!
            let yearInt: Int = Int(yearTextField.text ?? "0")!
            let timeInt: Int = Int(timeTextField.text ?? "0")!
            
            let newEventTime = Time(day: dayInt, month: monthInt, year: yearInt, time: timeInt)
        }*/
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let eventNameText = eventNameTextField.text ?? ""
        let eventDescriptionText = eventDescriptionTextField.text ?? ""
        let dayText = dayTextField.text ?? ""
        let monthText = monthTextField.text ?? ""
        let yearText = yearTextField.text ?? ""
        let timeText = timeTextField.text ?? ""
        
        //Add checks to not enable save button if
        //fields are not proper length/size or data type
        
        //Add check for date within days of month        
        
        saveButton.isEnabled = !eventNameText.isEmpty && !eventDescriptionText.isEmpty && Int(yearText) != nil && Int(monthText) != nil && Int(dayText) != nil && Int(timeText) != nil && (yearText.count == 4) && (monthText.count == 2 || monthText.count == 1) && (dayText.count == 1 || dayText.count == 2) && (timeText.count == 4)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let eventName = eventNameTextField.text ?? ""
        let eventDescription = eventDescriptionTextField.text ?? ""
        let dayInt: Int = Int(dayTextField.text ?? "0")!
        let monthInt: Int = Int(monthTextField.text ?? "0")!
        let yearInt: Int = Int(yearTextField.text ?? "0")!
        let timeInt: Int = Int(timeTextField.text ?? "0")!
        let newEventTime = Time(day: dayInt, month: monthInt, year: yearInt, time: timeInt)
        
        event = Event(name: eventName, description: eventDescription, date: newEventTime)
        scheduleLocal(name: eventName, descrip: eventDescription, time: newEventTime.time)
    }
    
    func scheduleLocal(name: String, descrip: String, time: Int)
    {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = name
        content.body = descrip
        content.categoryIdentifier = "Alarm" //custom action
        content.userInfo = ["CalendarEvent": name] //just custom data
        content.sound = .default //sound property
        
        var timeInArray = String(time).compactMap{Int(String($0))}
        if timeInArray.count == 3 {
            timeInArray.insert(0, at: 0)
        }
        
        var dateComponent = DateComponents()
        dateComponent.hour = Int(String("\(timeInArray[0])\(timeInArray[1])"))
        dateComponent.minute = Int(String("\(timeInArray[2])\(timeInArray[3])"))
        //this one is the real calendar
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        //this one is for immediate testing with time delay by 5 seconds
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
}
