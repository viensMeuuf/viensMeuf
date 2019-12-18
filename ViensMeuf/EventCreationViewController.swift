//
//  EventCreationViewController.swift
//  ViensMeuf
//
//  Created by Jasmine on 16/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class EventCreationViewController: UIViewController {
    
    
//bouton Publier
    
    @IBOutlet weak var addEventToEventList: UIButton!
    
    
    @IBAction func publicate(_ sender: Any) {

        eventList.append(Event(creator: nil, eventGroup: nil, date: Date(), titleEvent: "title", place: "test"))
    }
    
    func listKeywords() -> [String] {
    var result = [String]()
    for event in eventList {
        result.append(event.titleEvent)
    }
    return result
}
//    quand on clique sur ce bouton
//    je veux que cette func s'exécute
    

 
//    PickerView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
        
        
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
