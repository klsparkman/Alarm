//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Kelsey Sparkman on 3/2/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchValueChanged(_ sender: Any) {
    }
    
    var alarm: Alarm? {
        didSet {
//            updateViews()
        }
    }
    
    
    
}
