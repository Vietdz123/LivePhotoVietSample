//
//  ViewController.swift
//  Live Photos Sample
//
//  Created by MAC on 01/12/2023.
//  Copyright © 2023 Limit Point LLC. All rights reserved.
//

import UIKit
import AVFoundation

class ImageController: UIViewController {
    
    // MARK: - Properties
    var Player: AVPlayer!
    var PlayerItem: AVPlayerItem!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayerItem = AVPlayerItem(url: URL(string: "https://cdn-wallpaper.eztechglobal.com/upload/videos/bMbnZS5t1bgUSh5JUn339xBNHWqfsS5dQIB7kPgF.mp4")!)
        PlayerItem.addObserver(self, forKeyPath: "timedMetadata", options: [], context: nil)
        Player = AVPlayer(playerItem: PlayerItem)
        Player.play()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    -> Void {

        if keyPath != "timedMetadata" { return }

        var data: AVPlayerItem = object as! AVPlayerItem

        for item in data.timedMetadata as! [AVMetadataItem] {
            print("DEBUG: \(item.value)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //ffmpeg -i no_meta.mov -i subs.srt -c copy -c:s mov_text -movflags +faststart out.mp4
    }
    
    
    // MARK: - Methods
    
    
    // MARK: - Selectors
    
}

