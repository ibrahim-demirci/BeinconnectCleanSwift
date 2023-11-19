//
//  AppContext.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation
import UIKit
import AVKit


class AppContext {
    
    static let shared = AppContext()
    
    private init() {}
    
    var loadingView: UIView?
    
}
