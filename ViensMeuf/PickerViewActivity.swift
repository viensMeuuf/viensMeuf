//
//  PickerViewActivity.swift
//  ViensMeuf
//
//  Created by Jasmine on 18/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class PickerViewActivity: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
        var sportList = ["Football","Rugby","Pingpong","Basketball","Piscine","Bowling","Yoga","Baseball","Volleyball","Handball","Running","Cycling","Escalade","Karting","Rollerblade","HorseRiding","Boxing","Tennis","Chess","Gymnastic","Dance"]


    @IBOutlet weak var eventActivity: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sportList.count
    }
    
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let sportListToDisplay = sportList[row]
        return sportListToDisplay
    }
    
    
    func sendLove(){
        print("love")
    }
    
    
    
    
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    let selectedName = EventList[row]
//        NameLabel.text = selectedName
//
//    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        eventActivity.dataSource = self
        eventActivity.delegate = self
        
        sendLove()
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
