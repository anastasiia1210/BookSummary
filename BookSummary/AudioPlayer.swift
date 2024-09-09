import Foundation
import AVFoundation

struct AudioPlayer: Equatable {
    let files = ["1", "2", "3"]
    var currentFileIndex = 0
    var player: AVPlayer?
    var currentTime: TimeInterval = 0.0
    var totalTime: TimeInterval = 0.0
    var speed: Float = 1.0
    var isPaused: Bool = true
    
    init() {
        setup()
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    mutating func changeSpeed() {
        speed += 0.5
        if speed > 2 {
            speed = 0.5
        }
        player?.rate = speed
        if isPaused{pause()}
    }
    
    mutating func playNext() {
        if currentFileIndex != files.count - 1 {
            currentFileIndex += 1
        }else{
            currentFileIndex = 0
        }
        speed = 1.0
        setup()
        if !isPaused{
            play()
        } else {
            pause()
        }
    }
    
    mutating func playPrevious() {
        if currentFileIndex != 0 {
            currentFileIndex -= 1
        } else {
            currentFileIndex = files.count - 1
        }
        speed = 1.0
        setup()
        if !isPaused{
            play()
        } else {
            pause()
        }
    }
    
    mutating func fastForward() {
        let seconds = 10.0
        guard let player = player else { return }
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = min(currentTime + seconds, totalTime)
        player.seek(to: CMTime(seconds: newTime, preferredTimescale: 1))
    }
    
    mutating func fastBackward() {
        let seconds = 10.0
        guard let player = player else { return }
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = max(currentTime - seconds, 0)
        player.seek(to: CMTime(seconds: newTime, preferredTimescale: 1))
    }
    
    mutating func updateCurrentTime() {
        guard let player = player else { return }
        currentTime = CMTimeGetSeconds(player.currentTime())
    }
    
    mutating func update() {
        guard let player = player else { return }
        currentTime = CMTimeGetSeconds(player.currentTime())
    }
    
    mutating func seekAudio(_ time: TimeInterval) {
        guard let player = player else { return }
        let cmTime = CMTime(seconds: time, preferredTimescale: 1)
        player.seek(to: cmTime)
    }
    
    mutating func setup() {
        do{
            guard let url = Bundle.main.url(forResource: files[currentFileIndex], withExtension: "mp3") else {
                let error = NSError(domain: NSCocoaErrorDomain, code: NSFileReadNoSuchFileError, userInfo: [
                    NSLocalizedDescriptionKey: "Audio file not found"
                ])
                throw error
            }
            
            player = AVPlayer(url: url)
            totalTime = CMTimeGetSeconds(player?.currentItem?.asset.duration ?? CMTime.zero)
            player?.rate = speed
            updateCurrentTime()
        }catch{
            print(error.localizedDescription)
        }
    }
}

