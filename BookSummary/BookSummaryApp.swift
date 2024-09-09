import SwiftUI
import ComposableArchitecture

@main
struct BookSummaryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: AudioReducer.State(), reducer: {
                AudioReducer()
            }))
        }
    }
}

