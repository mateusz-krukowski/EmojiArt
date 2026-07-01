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
            let store = EmojiArtDocumentStore(named: "Emoji Art")
            store.addDocument()
            store.addDocument(named: "Hello World")
            return EmojiArtDocumentChooser().environmentObject(store)
        }
    }
}
