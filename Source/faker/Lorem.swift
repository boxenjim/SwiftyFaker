//
//  Lorem.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    class Lorem: Faker {
        static func word() -> String {
            let wrds = words(1) as [String]
            let word = wrds.first!
            return word
        }
        
        static func words(count: Int = 3, supplemental: Bool = false) -> [String] {
            let lorem = readjson("lorem") as! NSDictionary
            let key = supplemental ? "supplemental" : "words"
            let values = lorem[key] as! NSArray
            var array = [String]()
            
            for _ in 0...count {
                let randInt = randomInt(NSMakeRange(0, values.count))
                array.append(values[Int(randInt)] as! String)
            }
            
            return array
        }
        
        static func sentence(wordCount: Int = 4, supplimental: Bool = false/*, randomWordsToAdd: Int = 6*/) -> String {
            let array = words(wordCount, supplemental: supplimental)
            let sentence = array.joinWithSeparator(" ")
            return sentence + "."
        }
        
        //        # Optional arguments: char_count=255
        //        Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5wrj85fefue0y7y6m56b6omquh7br7dhqijwlawejpl765nb1716idmp3xnfo85v349pzy2o9rir23y2qhflwr71c1585fnynguiphkjm8p0vktwitcsm16lny7jzp9t4drwav3qmhz4yjq4k04x14gl6p148hulyqioo72tf8nwrxxcclfypz2lc58lsibgfe5w5p0xv95peafjjmm2frkhdc6duoky0aha"
        //        Faker::Lorem.characters(10) #=> "ang9cbhoa8"
        //
        //        # Optional arguments: word_count=4, supplemental=false, random_words_to_add=6
        //        Faker::Lorem.sentence #=> "Dolore illum animi et neque accusantium."
        //        Faker::Lorem.sentence(3) #=> "Commodi qui minus deserunt sed vero quia."
        //        Faker::Lorem.sentence(3, true) #=> "Inflammatio denego necessitatibus caelestis autus illum."
        //        Faker::Lorem.sentence(3, false, 4) #=> "Aut voluptatem illum fugit ut sit."
        //        Faker::Lorem.sentence(3, true, 4) #=> "Accusantium tantillus dolorem timor."
        //
        //        # Optional arguments: sentence_count=3, supplemental=false
        //        Faker::Lorem.sentences #=> ["Vero earum commodi soluta.", "Quaerat fuga cumque et vero eveniet omnis ut.", "Cumque sit dolor ut est consequuntur."]
        //        Faker::Lorem.sentences(1) #=> ["Ut perspiciatis explicabo possimus doloribus enim quia."]
        //        Faker::Lorem.sentences(1, true) #=> ["Quis capillus curo ager veritatis voro et ipsum."]
        //
        //        # Optional arguments: sentence_count=3, supplemental=false, random_sentences_to_add=3
        //        Faker::Lorem.paragraph #=> "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente."
        //        Faker::Lorem.paragraph(2) #=> "Illo qui voluptas. Id sit quaerat enim aut cupiditate voluptates dolorum. Porro necessitatibus numquam dolor quia earum."
        //        Faker::Lorem.paragraph(2, true) #=> "Cedo vero adipisci. Theatrum crustulum coaegresco tonsor crastinus stabilis. Aliqua crur consequatur amor una tolero sum."
        //        Faker::Lorem.paragraph(2, false, 4) #=> "Neque aut et nemo aut incidunt voluptates. Dolore cum est sint est. Vitae assumenda porro odio dolores fugiat. Est voluptatum quia rerum."
        //        Faker::Lorem.paragraph(2, true, 4) #=> "Vomito unde uxor annus. Et patior utilis sursum."
        //
        //        # Optional arguments: paragraph_count=3, supplemental=false
        //        Faker::Lorem.paragraphs #=> ["Dolores quis quia ad quo voluptates. Maxime delectus totam numquam. Necessitatibus vel atque qui dolore.", "Id neque nemo. Dolores iusto facere est ad. Accusamus ipsa dolor ut.", "Et officiis ut hic. Sunt asperiores minus distinctio debitis ipsa dolor. Minima eos deleniti."]
        //        Faker::Lorem.paragraphs(1) #=> ["Labore voluptas sequi. Ratione nulla eaque quia molestiae fugit. At quam laboriosam aut ut dignissimos."]
        //        Faker::Lorem.paragraphs(1, true)
    }
}