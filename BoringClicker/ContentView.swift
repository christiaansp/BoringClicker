import SwiftUI

struct ClickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 300, height: 200) // Set exact dimensions for the content
                .background(
                    VisualEffectView(material: .hudWindow, blendingMode: .withinWindow)
                        .edgesIgnoringSafeArea(.all)
                )
                .fixedSize() // Prevent the content from resizing
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Minimalistic window style
        .defaultAppStorage(UserDefaults.standard)
    }
}

struct ContentView: View {
    @State private var clickCount = 0
    @State private var message = "Are you really this bored?"

    let messages: [Int: String] = [
        10: "wow 10 clicks, thats not a lot...",
        50: "50 clicks? i suppose you're going for it, still not a lot.",
        69: "Hehe 69",
        100: "Wow 100? That's what i could count up to when i was 3 or something...",
        250: "250, how bored are you man? Get back to work you weirdo",
        500: "500, do your fingers hate you?",
        1000: "please stop, your finger said, suppose you're not doing that huh?",
        2500: "STOPPP PLEASE IM BEGGING YOU",
        5000: "THATS ENOUGH, STOP.",
        7500: "honestly i dont care anymore.",
        10000: "wow you've reached 10K clicks, is time really that worthless to you?"
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text("Clicks: \(clickCount)")
                .font(.largeTitle)

            Button(action: {
                clickCount += 1
                if let newMessage = messages[clickCount] {
                    message = newMessage
                }
            }) {
                Text("Click Me!")
                    .padding(10) // Padding for internal text space
                    .background(Color.blue.opacity(0.7)) // Visible button background
                    .foregroundColor(.white) // Button text color
                    .cornerRadius(8) // Rounded corners for the button
            }
            .buttonStyle(BorderlessButtonStyle()) // Prevent default button border styling
            .padding(.horizontal, 20) // Optional: Adjust padding around the button
        }
        .padding()
    }
}

struct VisualEffectView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = .active
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
