import SwiftUI

@main
struct BoringClicker: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 300, height: 200) // Set the exact content size
                .background(
                    VisualEffectView(material: .hudWindow, blendingMode: .withinWindow)
                        .edgesIgnoringSafeArea(.all)
                )
                .onAppear {
                    setWindowSize()
                }
        }
    }
}
