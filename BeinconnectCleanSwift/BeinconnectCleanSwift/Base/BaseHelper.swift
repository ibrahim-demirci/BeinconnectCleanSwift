//
//  BaseHelper.swift
//  BeinconnectCleanSwift
//
//  Created by İbrahim on 18.11.2023.
//

import Foundation
import UIKit
import MapKit
import AVKit

class BaseHelper {
    
    private class func getWindow() -> UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
    }
    
    class func getWidth() -> CGFloat {
        return getWindow()?.frame.size.width ?? 0
    }
    
    class func getHeight() -> CGFloat {
        return getWindow()?.frame.size.height ?? 0
    }
    
    class func showMediaPlayer(url: String) {
        
        let avPlayer = AVPlayer(url: URL(string: url)!)
        let avController = AVPlayerViewController()
        avController.player = avPlayer
    
        UIApplication.shared.topViewController()?.present(avController, animated: true) {
            avPlayer.play()
        }
    }
    
    class func attachLoadingView() {
        
        DispatchQueue.main.async {
            let window = UIApplication
                .shared
                .connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .last
            
            if let loadingView = AppContext.shared.loadingView {
                window?.addSubview(loadingView)
                
            } else {
                
                let loadingView = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width: window?.frame.size.width ?? 0, height: window?.frame.size.height ?? 0))
                loadingView.startAnimating()
                
                
                loadingView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
                
                AppContext.shared.loadingView = loadingView
                
                window?.addSubview(loadingView)
            }
        }
    }
    
    class func detachLodingView() {
        DispatchQueue.main.async {
            AppContext.shared.loadingView?.removeFromSuperview()
        }
    }
}
