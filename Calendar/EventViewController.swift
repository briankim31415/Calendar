//
//  EventViewController.swift
//  Calendar
//
//  Created by Johnson, Joshua A on 5/8/19.
//  Copyright © 2019 3BMAD. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    var event : Event?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        nameTextField.text = event?.name
        descriptionTextField.text = event?.itemDescription
        dateTextField.text = event?.date.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
