//
//  CustomWindowScene.swift
//  BoringClicker
//
//  Created by Christiaan Spithout on 28/12/2024.
//

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
            window.styleMask = [.titled, .closable, .miniaturizable] // Optional: Configure buttons
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
                window.styleMask = [.closable, .miniaturizable, .titled] // Optional: Set other behaviors here
                window.setContentSize(NSSize(width: 300, height: 200)) // Exact size of the content
                window.isMovableByWindowBackground = true
            }
        }

        return hostingController
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
}
