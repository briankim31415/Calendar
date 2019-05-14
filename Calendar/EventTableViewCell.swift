//
//  EventTableViewCell.swift
//  
//
//  Created by Kim, Brian M on 5/14/19.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with event: Event) {
        eventName.text = event.name
        eventDescription.text = event.itemDescription
        var timeInArray = String(event.date.time).compactMap{Int(String($0))}
        if timeInArray.count == 3 {
            timeInArray.insert(0, at: 0)
        }
        let regularTime: String = "\(timeInArray[0])\(timeInArray[1]):\(timeInArray[2])\(timeInArray[3])"
        eventTime.text = "\(regularTime) @ \(event.date.month)/\(event.date.day)/\(event.date.year)"
    }
}
