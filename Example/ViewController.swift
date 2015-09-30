//
//  ViewController.swift
//  Example
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import UIKit
import SwiftyFaker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Address
        print("***** Address *****")
        print(Faker.Address.buildingNumber())
        print(Faker.Address.city())
        print(Faker.Address.cityPrefix())
        print(Faker.Address.citySuffix())
        print(Faker.Address.country())
        print(Faker.Address.countryCode())
        print(Faker.Address.latitude())
        print(Faker.Address.longitude())
        print(Faker.Address.postcode())
        print(Faker.Address.secondaryAddress())
        print(Faker.Address.state())
        print(Faker.Address.stateAbbr())
        print(Faker.Address.streetAddress())
        print(Faker.Address.streetName())
        print(Faker.Address.streetSuffix())
        print(Faker.Address.timezone())
        print(Faker.Address.zip())
        print(Faker.Address.zipCode())
        print("")
        
        // App
        print("***** App *****")
        print("")
        
        // Bitcoin
        print("***** Bitcoin *****")
        print("")
        
        // Book
        print("***** Book *****")
        print("")
        
        // Business
        print("***** Business *****")
        print("")
        
        // Code
        print("***** Code *****")
        print("")
        
        // Color
        print("***** Color *****")
        print("")
        
        // Commerce
        print("***** Commerce *****")
        print("")
        
        // Company
        print("***** Company *****")
        print("")
        
        // Date
        print("***** Date *****")
        print("")
        
        // Finance
        print("***** Finance *****")
        print("")
        
        // Hacker
        print("***** Hacker *****")
        print("")
        
        // Internet
        print("***** Internet *****")
        print("")
        
        // Lorem
        print("***** Lorem *****")
        print(Faker.Lorem.character())
        print(Faker.Lorem.characters())
        print(Faker.Lorem.word())
        print(Faker.Lorem.words())
        print(Faker.Lorem.sentence())
        print(Faker.Lorem.sentences())
        print(Faker.Lorem.paragraph())
        print(Faker.Lorem.paragraphs())
        print("")
        
        // Name
        print("***** Name *****")
        print(Faker.Name.name())
        print(Faker.Name.firstName())
        print(Faker.Name.lastName())
        print(Faker.Name.prefix())
        print(Faker.Name.suffix())
        print(Faker.Name.title())
        print("")
        
        // Number
        print("***** Number *****")
        print("")
        
        // PhoneNumber
        print("***** PhoneNumber *****")
        print("")
        
        // SlackEmoji
        print("***** SlackEmoji *****")
        print("")
        
        // Team
        print("***** Team *****")
        print("")
        
        // Time
        print("***** Time *****")
        print("")
        
        // University
        print("***** University *****")
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

