import SwiftUI
import ComposableArchitecture

struct BookCard: View {
    let viewStore: ViewStore<AudioReducer.State, AudioReducer.Action>
    
    var body: some View {
        VStack {
            Image(viewStore.image)
                .padding(.top, 30)
                .padding(.bottom, 30) 
            Text("KEY POINT \(viewStore.point) OF 10")
                .padding(.top, 3)
                .foregroundStyle(.secondary)
                .bold()
                .font(.system(size: 15))
            Text("\(viewStore.name) \(viewStore.audioPlayer.files[viewStore.audioPlayer.currentFileIndex]) part")
                .padding(.top, 3)
                .font(.system(size: 18))
        }
        
    }
}


