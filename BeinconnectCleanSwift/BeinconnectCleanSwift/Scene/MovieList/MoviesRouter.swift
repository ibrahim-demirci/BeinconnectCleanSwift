//
//  MoviesRouter.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import UIKit
import AVFoundation
import AVKit

class MoviesRouter: MoviesRoutingProtocol {
    
    weak var viewController: MoviesViewController?
    
    func navigateToMovieDetailsController(_ movie: Movie) {
        BaseHelper.showMediaPlayer(url: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
    }
}
