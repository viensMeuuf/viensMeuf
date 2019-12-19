//
//  EventDatePicker.swift
//  ViensMeuf
//
//  Created by Jasmine on 18/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class EventDatePicker: UIViewController {

//    @IBOutlet weak var datePicker: UIDatePicker!

//    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    func sendLove(){
        print("love")
    }
    
    func sendPeace(){
        print("peace")
    }
    
    func sendExcuses(){
        print("Sorry, not yet")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.

        sendLove()
        sendPeace()
        sendExcuses()
        
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
