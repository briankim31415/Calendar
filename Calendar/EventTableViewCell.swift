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
        eventTime.text = "\(event.date.time) @ \(event.date.month)/\(event.date.day)/\(event.date.year)"
    }
}
