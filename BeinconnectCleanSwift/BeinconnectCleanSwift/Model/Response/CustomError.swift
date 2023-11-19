//
//  CustomError.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation

enum CustomErrors: Error  {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}
