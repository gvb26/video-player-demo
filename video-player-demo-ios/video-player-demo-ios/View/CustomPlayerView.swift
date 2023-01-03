//
//  CustomPlayerView.swift
//  video-player-demo-ios
//
//  Created by Gaurang Bham on 1/3/23.
//

import Foundation
import AVKit

class CustomPlayerView: UIView {
    
    lazy var playerLayer = AVPlayerLayer()
    lazy var player = AVPlayer()
    var viewModel: VideoViewModel? {
        didSet {
            guard let url = viewModel?.url else {
                return
            }
            player = AVPlayer(url: url)
            playerLayer = AVPlayerLayer(player: player)
        }
    }
    
    func start() {
        setUpPlayerLayer()
        addObservers()
        player.play()
    }
    
    // Initializes playerLayer, sets up the aspect ratio and adds it to the View Layer
    func setUpPlayerLayer() {
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)
    }
    
    func addObservers() {
        addPeriodicTimeObserver()
        player.addObserver(self, forKeyPath: "rate", options: NSKeyValueObservingOptions.new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(videoEnded), name:
        NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    // Observes once playback has started
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rate" {
            if player.rate > 0 {
                print("Playback has started")
            }
        }
    }
    
    // Is triggered once notifcation center indicated the AVPlayer did reach the end time of the video
    @objc func videoEnded(notification: NSNotification) {
        print("Playback has ended")
    }
    
    func addPeriodicTimeObserver() {
        // Creates the 0.5 second interval to observe
        let interval = CMTime(seconds: 0.5,
                              preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        // Prints the time in seconds every time the interval is reached
        _ =
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main) {
                [weak self] time in
            print(self?.player.currentTime().seconds ?? 0.0)
        }
    }
    
}
