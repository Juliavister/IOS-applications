//
//  SecondViewController.swift
//  LooveablePlants
//
//  Created by Julia Vister on 27/04/2023.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController{
    
    @IBOutlet weak var titletxt: UITextField!
    @IBOutlet weak var bodytxt: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setReminder(_ sender: UIButton) {
        let targetDate = dateField.date
        if let TextTitle = titletxt.text, !TextTitle.isEmpty, let body = bodytxt.text, !body.isEmpty {
            let content = UNMutableNotificationContent()
            content.title = TextTitle
            content.body = body
            content.sound = .default
            //UNNotificationSound(named: UNNotificationSoundName("iphone_ringtone"))
            
            let getDate = targetDate.addingTimeInterval(10)
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.month, .day, .year, .hour, .minute], from: getDate), repeats: false)
            
            let request = UNNotificationRequest(identifier: "id_\\(TextTitle)", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) {error in
                if error != nil {
                    print("I'm sorry,something went wrong")
                    self.statusLabel.text = "Notification scheduling failed"
                }
                else {
                    print("Notification scheduled successfully")
                    self.statusLabel.text = "Notification scheduled"
                }
            }
        }
    }
}
