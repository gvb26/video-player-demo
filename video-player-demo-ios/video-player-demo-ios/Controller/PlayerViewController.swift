//
//  PlayerViewController.swift
//  video-player-demo-ios
//
//  Created by Gaurang Bham on 1/3/23.
//

import UIKit
import AVKit

class PlayerViewController: UIViewController {
    
    lazy var playerView: CustomPlayerView = {
        let view = CustomPlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let video = Video(url: VideoURLs.squareTestPattern)
        playerView.viewModel = VideoViewModel(video: video)
        setUpViews()
        playerView.start()
    }
    
    // Setting up playerView Constraints
    func setUpViews() {
        
        [playerView].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            playerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        playerView.playerLayer.frame = self.view.bounds
    }
    
    // Handles when screen orientation is changed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        playerView.playerLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }


}

