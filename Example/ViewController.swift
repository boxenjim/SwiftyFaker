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
        print("BUILDING_NUMBER: \(Faker.Address.buildingNumber())")
        print("CITY: \(Faker.Address.city())")
        print("CITY_PREFIX: \(Faker.Address.cityPrefix())")
        print("CITY_SUFFIX: \(Faker.Address.citySuffix())")
        print("COUNTRY: \(Faker.Address.country())")
        print("COUNTRY_CODE: \(Faker.Address.countryCode())")
        print("LATITUDE: \(Faker.Address.latitude())")
        print("LONGITUDE: \(Faker.Address.longitude())")
        print("POSTCODE: \(Faker.Address.postcode())")
        print("SECONDARY_ADDRESS: \(Faker.Address.secondaryAddress())")
        print("STATE: \(Faker.Address.state())")
        print("STATE_ABBR: \(Faker.Address.stateAbbr())")
        print("STREET_ADDRESS: \(Faker.Address.streetAddress())")
        print("STREET_NAME: \(Faker.Address.streetName())")
        print("STREET_SUFFIX: \(Faker.Address.streetSuffix())")
        print("TIMEZONE: \(Faker.Address.timezone())")
        print("ZIP: \(Faker.Address.zip())")
        print("ZIP_CODE: \(Faker.Address.zipCode())")
        print("")
        
        // App
        print("***** App *****")
        print("NAME: \(Faker.App.name())")
        print("VERSION: \(Faker.App.appVersion())")
        print("AUTHOR: \(Faker.App.author())")
        print("")
        
        // Bitcoin
        print("***** Bitcoin *****")
        print("")
        
        // Book
        print("***** Book *****")
        print("TITLE: \(Faker.Book.title())")
        print("PUBLISHER: \(Faker.Book.publisher())")
        print("AUTHOR: \(Faker.Book.author())")
        print("")
        
        // Business
        print("***** Business *****")
        print("CREDIT_CARD_NUMBER: \(Faker.Business.creditCardNumber())")
        print("CREDIT_CARD_EXPIRY: \(Faker.Business.creditCardExpiry())")
        print("CREDIT_CARD_TYPE: \(Faker.Business.creditCardType())")
        print("")
        
        // Code
        print("***** Code *****")
        print("")
        
        // Color
        print("***** Color *****")
        print("")
        
        // Commerce
        print("***** Commerce *****")
        print("COLOR: \(Faker.Commerce.color())")
        print("DEPARTMENT: \(Faker.Commerce.department())")
        print("PRODUCT_NAME: \(Faker.Commerce.productName())")
        print("MATERIAL: \(Faker.Commerce.material())")
        print("PRICE: \(Faker.Commerce.price())")
        print("PRODUCT: \(Faker.Commerce.product())")
        print("")
        
        // Company
        print("***** Company *****")
        print("NAME: \(Faker.Company.name())")
        print("SUFFIX: \(Faker.Company.suffix())")
        print("CATCH_PHRASE: \(Faker.Company.catchPhrase())")
        print("BUZZWORD: \(Faker.Company.buzzword())")
        print("BS: \(Faker.Company.bs())")
        print("EIN: \(Faker.Company.ein())")
        print("DUNS_NUMBER: \(Faker.Company.dunsNumber())")
        print("LOGO: \(Faker.Company.logo())")
        print("SWEDISH_ORGANISATION_NUMBER: \(Faker.Company.swedishOrganisationNumber())")
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
        print("CHARACTER: \(Faker.Lorem.character())")
        print("CHARACTERS: \(Faker.Lorem.characters())")
        print("WORD: \(Faker.Lorem.word())")
        print("WORDS: \(Faker.Lorem.words())")
        print("SENTENCE: \(Faker.Lorem.sentence())")
        print("SENTENCES: \(Faker.Lorem.sentences())")
        print("PARAGRAPH: \(Faker.Lorem.paragraph())")
        print("PARAGRAPHS: \(Faker.Lorem.paragraphs())")
        print("")
        
        // Name
        print("***** Name *****")
        print("NAME: \(Faker.Name.name())")
        print("FIRST_NAME: \(Faker.Name.firstName())")
        print("LAST_NAME: \(Faker.Name.lastName())")
        print("PREFIX: \(Faker.Name.prefix())")
        print("SUFFIX: \(Faker.Name.suffix())")
        print("TITLE: \(Faker.Name.title())")
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
        print("NAME: \(Faker.University.name())")
        print("PREFIX: \(Faker.University.prefix())")
        print("SUFFIX: \(Faker.University.suffix())")
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

