//
//  Event.swift
//  ViensMeuf
//
//  Created by Jasmine on 16/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit



enum Gender {
    case male, female
}

enum XpCategory {
    case debutante, amatrice, aguerrie, professionnelle
}

enum MotivationCategory {
    case fun, serious
}


struct User {
    var gender: Gender
    var age: Int?
    var mailAdress: String // /!\ HAVE TO accept only x...xx@x...x.xx
    var telephoneNumber: Int?
    var firstname: String
    var lastname: String?
    var favoriteSport: String? /// pas forcément une string?
    var description: String?
    var avatar: UIImage?
    var coach: Bool?
    var xpCategory: XpCategory
    var motivationCategory: MotivationCategory
    var listEvent = ["titleEvent"]
    
}

// MARK: - Event



//      ⇩ 22 SPORTS
enum SportCategory {
    case football, rugby, pingpong, basketball, swimming, bowling, judo, martialArts, yoga, baseball, volleyball, handball, running, cycling, climbing, karting, rollerblade, horseRiding, boxing, tennis, chess, gymnastic, dance
}



struct Event {
//    var sportCategory: SportCategory
//    var motivationCategory: MotivationCategory // j'utilise la même var pour Event que pour User
    
    var creator: User?
    var eventGroup: [User]?
    //    var eventGroup: Array d'objets User ???
    //     eventConversationGroup = eventGroup
//    var place: NSMapTableOptions? // ???????
    var date: Date? //
    //    var hour: Hour ????
//    var avatarEvent: UIImage?
    var titleEvent: String
    
    var place: String
    
}


//let event1 = Event(date: "20-12-2019", titleEvent: "Footing", place: "Parce de Sceaux")

