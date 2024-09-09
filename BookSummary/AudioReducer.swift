import Foundation
import ComposableArchitecture

struct AudioReducer: Reducer {
    struct State: Equatable {
        var audioPlayer = AudioPlayer()
        let name = "Aesop's Fables"
        let image = "book"
        var point = 2
    }
    
    enum Action: Equatable {
        case pause
        case playPrevious
        case playNext
        case changeSpeed
        case fastForward
        case fastBackward
        case updateCurrentTime
        case updateTime
        case seek(TimeInterval)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
            
        case .pause:
            state.audioPlayer.isPaused = !state.audioPlayer.isPaused
            if state.audioPlayer.isPaused{
                state.audioPlayer.pause()
            }else{
                state.audioPlayer.play()
            }
            return .none
            
        case .playNext:
            state.audioPlayer.playNext()
            return .none
            
        case .playPrevious:
            state.audioPlayer.playPrevious()
            return .none
            
        case .changeSpeed:
            state.audioPlayer.changeSpeed()
            return .none
            
        case .fastForward:
            state.audioPlayer.fastForward()
            return .none
            
        case .fastBackward:
            state.audioPlayer.fastBackward()
            return .none
            
        case .updateCurrentTime:
            state.audioPlayer.updateCurrentTime()
            return .none
            
        case .updateTime:
            state.audioPlayer.updateCurrentTime()
            return .none
            
        case .seek(let time):
            state.audioPlayer.seekAudio(time)
            return .none
        }
    }
}

