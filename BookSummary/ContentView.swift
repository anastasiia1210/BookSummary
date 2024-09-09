import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<AudioReducer>
    
    var body: some View {
        WithViewStore(store, observe: {$0}){ viewStore in
            VStack {
                BookCard(viewStore: viewStore)
                SliderWithTime(viewStore: viewStore)
                AudioControlView(viewStore: viewStore)
                Spacer()
            }.onAppear{
                viewStore.send(.pause)
            }
            .onReceive(Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()){
                _ in  viewStore.send(.updateTime)
            }
        }
    }
}


#Preview {
    ContentView(store: Store(initialState: AudioReducer.State(), reducer: {
        AudioReducer()
    }))
}
