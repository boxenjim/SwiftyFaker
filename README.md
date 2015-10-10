# SwiftyFaker

[![Build Status](https://travis-ci.org/boxenjim/SwiftyFaker.svg)](https://travis-ci.org/boxenjim/SwiftyFaker) [![Join the chat at https://gitter.im/boxenjim/SwiftyFaker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/boxenjim/SwiftyFaker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
<!--![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)-->


A fake data generator written in Swift. Inspired by and Aspiring to be as amazing as the [Ruby](https://www.ruby-lang.org/en/) [gem](https://rubygems.org), [Faker](https://github.com/stympy/faker).

## Usage
```swift
Faker.Name.name() -> "Nellie Buckridge Jr."
Faker.Lorem.sentence() -> "voluptas consequatur magnam harum."
```

## Faker.Address
```swift
Faker.Address.buildingNumber() -> "220"
Faker.Address.city() -> "Lake Derrickport"
Faker.Address.cityPrefix() -> "Port"
Faker.Address.citySuffix() -> "ton"
Faker.Address.country() -> "Zambia"
Faker.Address.countyCode() -> "FO"
Faker.Address.latitude() -> "-17.1575853332711"
Faker.Address.longitude() -> "74.6779822763161"
Faker.Address.postcode() -> "10816-7015"
Faker.Address.secondaryAddress() -> "Suite 866"
Faker.Address.state() -> "Missouri"
Faker.Address.stateAbbr() -> "AK"
Faker.Address.streetAddress() -> "659 Blanda Plains"
Faker.Address.steetName() -> "Casandra Shore"
Faker.Address.streetSuffix() -> "Avenue"
Faker.Address.timezone() -> "Europe/Bucharest"
Faker.Address.zip() -> "53097-3343"
Faker.Address.zipCode() -> "82782"
```

## Faker.App
```swift
Faker.App.name() -> "Alphazap"
Faker.App.appVersion() -> "1.5.2"
Faker.App.author() -> "Otha Braun"
```

<!--## Faker.Bitcoin-->
<!-------------------->
<!--```swift-->
<!--```-->

## Faker.Book
```swift
Faker.Book.title() -> "The Zookeeper and Her Tiger"
Faker.Book.author() -> "Janie Bashirian"
Faker.Book.publisher() -> "Parker Publishing"
```

## Faker.Business
```swift-->
Faker.Business.creditCardNumber() -> "1234-2121-1221-1211"
Faker.Business.creditCardExpiry() -> 2019-10-05 06:00:00 +0000
Faker.Business.creditCardType() -> "discover"
```

<!--## Faker.Code-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.Color-->
<!-------------------->
<!--```swift-->
<!--```-->

## Faker.Commerce
```swift
Faker.Commerce.color() -> "maroon"
Faker.Commerce.department() -> "Electronics & Garden"
Faker.Commerce.productName() -> "Aerodynamic Iron Computer"
Faker.Commerce.material() -> "Silk"
Faker.Commerce.price() -> 3.72
Faker.Commerce.product() -> Bag
```

## Faker.Company
```swift
Faker.Company.name() -> "Labadie-Wisoky"
Faker.Comany.suffix() -> "and Sons"
Faker.Company.catchPhrase() -> "Public-key context-sensitive core"
Faker.Company.buzzword() -> "Enhanced"
Faker.Company.bs() -> "streamline scalable e-business"
Faker.Company.ein() -> "82-8784359"
Faker.Company.dunNumber() -> "57-381-4056"
Faker.Company.logo() -> "http://pigment.github.io/fake-logos/logos/medium/color/10.png"
Faker.Company.swedishOrganisationNumber() -> "57189359064"
```

<!--## Faker.Date-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.Finance-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.Hacker-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.Internet-->
<!-------------------->
<!--```swift-->
<!--```-->

## Faker.Lorem
```swift
Faker.Lorem.word() -> "sed"
Faker.Lorem.words() -> ["vel", "officia", "perferendis"]
Faker.Lorem.sentence() -> "dicta ipsum eveniet recusandae."
```

## Faker.Name
```swift
Faker.Name.name() -> "Mrs. Grant Wilkinson"
Faker.Name.firstName() -> "Willy"
Faker.Name.lastName() -> "Rolfson"
Faker.Name.prefix() -> "Ms."
Faker.Name.suffix() -> "II"
Faker.Name.Title() -> "Future Identity Inspector"
```

<!--## Faker.Number-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.PhoneNumber-->
<!-------------------->
<!--```swift-->
<!--```-->

<!--## Faker.SlackEmoji-->
<!-------------------->
<!--```swift-->
<!--```-->

## Faker.Team
```swift
Faker.Team.creature() -> "chickens"
Faker.Team.name() -> "Washington sheep"
Faker.Team.sport() -> "wrestling"
Faker.Team.state() -> "Utah"
```

<!--## Faker.Time-->
<!-------------------->
<!--```swift-->
<!--```-->

## Faker.University
```swift
Faker.University.name() -> "Eastern Indiana Institute"
Faker.University.prefix() -> "West"
Faker.University.suffix() -> "University"
```

<!--## Installation-->

<!--#### Carthage-->

<!--Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).-->

<!--```ogdl-->
<!--github "boxenjim/SwiftyFaker"-->
<!--```-->

<!--Then run `carthage update`.-->

<!--#### Cocoapods-->

<!--Add the following line to your Podfile.-->

<!--```-->
<!--pod "SwiftyFaker", "~> 0.0.1"-->
<!--```-->

<!--Then run `pod install` with Cocoapods 0.36 or newer.-->

<!--#### Manually-->

<!--Just drag and drop the `.swift` files in the `SwiftyFaker` folder into your project.-->

## Tests

Open the Xcode project and press `⌘-U` to run the tests.

## Contributing

* Create something awesome, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)
* There's a ton of people out there way smarter than me, please contribute


## Contact

Feel free to get in touch.
* Gitter: [![Join the chat at https://gitter.im/boxenjim/SwiftyFaker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/boxenjim/SwiftyFaker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
* Twitter: [@boxenjim](http://twitter.com/boxenjim)
