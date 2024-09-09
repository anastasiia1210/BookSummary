import SwiftUI
import ComposableArchitecture

struct AudioControlView: View {
    let viewStore: ViewStore<AudioReducer.State, AudioReducer.Action>
    
    var body: some View {
        VStack{
            Button(action: {
                viewStore.send(.changeSpeed)
            }){
                Text("Speed x\(String(format: "%.1f", viewStore.audioPlayer.speed))")
                    .padding(10)
                    .font(.system(size: 15).bold())
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
            }
            HStack(spacing: 10){
                Button(action: { viewStore.send(.playPrevious) }) {
                    Image(systemName: "backward.end.fill")
                }
                .frame(width: 50, height: 50)
                Button(action: { viewStore.send(.fastBackward) }) {
                    Image(systemName: "gobackward.10")
                        .font(.system(size: 26))
                }
                .frame(width: 50, height: 50)
                Button(action: { viewStore.send(.pause) }) {
                    Image(systemName: viewStore.audioPlayer.isPaused ? "play.fill" : "pause.fill")
                        .font(.system(size: 40))
                }
                .frame(width: 50, height: 50)
                Button(action: { viewStore.send(.fastForward) }) {
                    Image(systemName: "goforward.10")
                        .font(.system(size: 26))
                }
                .frame(width: 50, height: 50)
                Button(action: { viewStore.send(.playNext) }) {
                    Image(systemName: "forward.end.fill")
                }
                .frame(width: 50, height: 50)
            }.font(.system(size: 24))
                .padding(.vertical, 30)
        }.foregroundColor(.black)
    }
}

