//
//  EventDetailsViewController.swift
//  ViensMeuf
//
//  Created by Kasipillai on 16/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var myEventAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.layer.borderWidth = 3.0;
        
         myLabel.layer.borderColor = UIColor.green.cgColor
        
        myEventAvatar.layer.borderWidth = 3.0;
        myEventAvatar.layer.borderColor = UIColor.green.cgColor
        
        
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
