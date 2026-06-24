//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Mateusz on 23/06/2026.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
