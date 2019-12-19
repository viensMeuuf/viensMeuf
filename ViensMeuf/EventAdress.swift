//
//  EventAdress.swift
//  ViensMeuf
//
//  Created by Jasmine on 18/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class EventAdress: UIViewController {

    @IBOutlet weak var locationNameTextField: UITextField!
    
    @IBOutlet weak var numberLocationTextField: UITextField!
    
    
    @IBOutlet weak var streetLocationTextField: UITextField!
    
    
    @IBOutlet weak var postalCodeLocationTextField: UITextField!
    
    @IBOutlet weak var cityLocationTextField: UITextField!
    
    
    func sendLove(){
        print("love")
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        sendLove()
//    }
//
//
//    //        adressFromSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sendLove()

        let segueIdentifier = segue.identifier
        if segueIdentifier == "adressFromSegue" {
            print("functional")
            if let destination = segue.destination as? EventCreationViewController {
                destination.origin = ""
                }
        }
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
