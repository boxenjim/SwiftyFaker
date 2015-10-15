//: Playground - noun: a place where people can play

import UIKit
import SwiftyFaker

let digits = 10
let afterDigits = 10
let rand = Double.random()
let digitRand = rand * pow(Double(10), Double(digits + afterDigits))
let floorRand = floor(digitRand)
let afterDigitRand = floorRand / pow(Double(10), Double(afterDigits))

//let val = pow(Double(10), Double(3))
