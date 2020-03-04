//
//  AlarmDetalTableViewController.swift
//  Alarm
//
//  Created by Kelsey Sparkman on 3/2/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit


class AlarmDetalTableViewController: UITableViewController {
    // Mark: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmName: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    @IBAction func enableButtonTapped(_ sender: Any) {
        alarmIsOn = !alarmIsOn
        updateAlarm()
    }
    
    // Mark: - Properties
    var alarmIsOn: Bool = true
    var alarm: Alarm? {
        didSet {
            alarmIsOn = alarm?.enabled ?? true
            loadViewIfNeeded()
            updateAlarm()
        }
    }
    
    // Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Mark: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let alarmTitle = alarmName.text, let dateTitle = datePicker?.date {
            if let alarm = alarm {
                AlarmController.sharedInstance.updateAlarm(alarm: alarm, fireDate: dateTitle, name: alarmTitle, enabled: alarmIsOn)
            } else {
                AlarmController.sharedInstance.addAlarm(date: dateTitle, name: alarmTitle, enabled: alarmIsOn)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    // Mark: - Helper Functions
    func updateAlarm() {
        if alarmIsOn {
            enableButton.setTitle("Turned OFF", for: .normal)
        } else {
            enableButton.setTitle("Turned ON", for: .normal)
        }
    }
}//End of Class
