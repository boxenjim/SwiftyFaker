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
        print(Faker.Address.streetAddress())
        
        // Name
        print(Faker.Name.name())
        print(Faker.Name.firstName())
        print(Faker.Name.lastName())
        print(Faker.Name.prefix())
        print(Faker.Name.suffix())
        print(Faker.Name.title())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

