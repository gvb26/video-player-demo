# video-player-demo

## What is it?

The following is a Basic App that is fetching and playing a Video from a URL. The app prints when playback starts, ends as well as printing the playhead position every 0.5 seconds.

## Design Pattern Used

I decided to use MVVM design pattern because I felt it would divide responsibilities evenly between the Video Fetcher Call, the view and the actually controller. This way this logic can be reused throughout the app if expanded and maintain separation of responsibilites. I originally considered using a singleton pattern but decided against it in order to allow different video URLs to be used if the app were to be expanded.

## Build tools & versions used
Xcode 14.2 built for iOS 16

### Built With

* [Swift](https://www.swift.org/)

## Steps to run the app

Should be able to open to Xcode project, build and run directly on the simulator (CMD-R)

