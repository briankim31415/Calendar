//
//  EditEventTableViewController.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 5/14/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit

class EditEventTableViewController: UITableViewController {

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
        updateView()
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
        
        saveButton.isEnabled = !eventNameText.isEmpty && !eventDescriptionText.isEmpty && !yearText.isEmpty && !monthText.isEmpty && !dayText.isEmpty && !timeText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    func updateView() {
        guard let event = event else {return}
        eventNameTextField.text = event.name
        eventDescriptionTextField.text = event.description
        dayTextField.text = String(event.date.day)
        monthTextField.text = String(event.date.month)
        yearTextField.text = String(event.date.year)
        timeTextField.text = String(event.date.time)
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
    }

}
