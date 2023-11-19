//
//  Constants.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit

enum ViewDimensionConstants: CGFloat  {
    case zero = 0
    case eight = 8.0
    case four = 4.0
    case ten = 10.0
    case fifteen = 15.0
    case sixteen = 16.0
    case hundred = 100.0
    case oneHundredThirtyTwo = 132.0
    case twoHundred = 200.0
}

enum IntegerConstants: Int {
    case zero =  0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
}

enum API {
    static let baseURl = "https://api.themoviedb.org/3/"
    static let imageBaseUrl = "http://image.tmdb.org/t/p/w500"
    static let apiKey = "3bb3e67969473d0cb4a48a0dd61af747"
    static let locale = "en-US"
}
