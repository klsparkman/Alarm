//
//  File.swift
//  Alarm
//
//  Created by Kelsey Sparkman on 3/3/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation


class AlarmController {
    
    
    var alarms: [Alarm] = []
    
    init() {
        self.alarms = self.mockAlarms
    }
   
    static let sharedInstance = AlarmController()
    
    
    var mockAlarms: [Alarm] = [
        Alarm(date: Date(), name: "Work", enabled: true)
    ]
    
    func addAlarm(date: Date, name: String, enabled: Bool) {
        let alarm = Alarm(date: date, name: name, enabled: enabled)
        alarms.append(alarm)
        saveToPersistentStorage(alarms: alarms)
        
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        if let index = alarms.firstIndex(of: alarm) {
            alarms[index].date = fireDate
            alarms[index].name = name
            alarms[index].enabled = enabled
            saveToPersistentStorage(alarms: alarms)

        }
        
        func deleteAlarm(alarm: Alarm) {
            if let index = alarms.firstIndex(of: alarm) {
                alarms.remove(at: index)
                saveToPersistentStorage(alarms: alarms)

            }
        }
    }
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "Alarms.json"
        let documentDirectory = urls[0]
        let documentsDirectoryURL = documentDirectory.appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    func saveToPersistentStorage(alarms: [Alarm]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(alarms)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    func loadFromPersistence() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedData = try jsonDecoder.decode([Alarm].self, from: data)
            self.alarms = decodedData
        } catch let error {
            print("\(error.localizedDescription) -> \(error)")
        }
    }
    

    
}//End of class
