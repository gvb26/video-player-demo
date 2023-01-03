//
//  VideoViewModel.swift
//  video-player-demo-ios
//
//  Created by Gaurang Bham on 1/3/23.
//

import Foundation

struct VideoViewModel {
    var url: URL?
    // Handles video initialization
    init(video: Video) {
        guard let validURL = URL(string: video.url) else {
            print("Failure: URL not valid")
            return
        }
        self.url = validURL
    }
}
