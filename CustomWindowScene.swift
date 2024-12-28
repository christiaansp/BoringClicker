

import SwiftUI

struct CustomWindowScene<Content: View>: Scene {
    let content: Content

    var body: some Scene {
        WindowGroup {
            CustomWindow(content: content)
        }
    }
}

func setWindowSize() {
    DispatchQueue.main.async {
        if let window = NSApplication.shared.windows.first {
            window.setContentSize(NSSize(width: 300, height: 200))
            window.styleMask = [.titled, .closable, .miniaturizable]
            window.isOpaque = false
            window.isMovableByWindowBackground = true
        }
    }
}

struct CustomWindow<Content: View>: NSViewControllerRepresentable {
    let content: Content

    func makeNSViewController(context: Context) -> NSViewController {
        let hostingController = NSHostingController(rootView: content)
        let window = hostingController.view.window
        hostingController.view.frame = NSRect(x: 0, y: 0, width: 300, height: 200)

        DispatchQueue.main.async {
            if let window = window {
                window.styleMask = [.closable, .miniaturizable, .titled]
                window.setContentSize(NSSize(width: 300, height: 200)) 
                window.isMovableByWindowBackground = true
            }
        }

        return hostingController
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
}
