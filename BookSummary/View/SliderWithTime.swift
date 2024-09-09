import SwiftUI
import ComposableArchitecture

struct SliderWithTime: View {
    let viewStore: ViewStore<AudioReducer.State, AudioReducer.Action>
    
    var body: some View {
        HStack(spacing: 0){
            Spacer()
            Text(formatTime(seconds: viewStore.audioPlayer.currentTime))
            Slider(
                value: Binding(
                    get: { viewStore.audioPlayer.currentTime },
                    set: { newValue in
                        viewStore.send(.seek(newValue))
                    }
                ),
                in: 0...viewStore.audioPlayer.totalTime
            ) .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
                .frame(maxWidth: UIScreen.main.bounds.width*0.75)
            Text(formatTime(seconds: viewStore.audioPlayer.totalTime))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .font(.system(size: 15))
        .foregroundStyle(.secondary)
    }
    
    func formatTime(seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


