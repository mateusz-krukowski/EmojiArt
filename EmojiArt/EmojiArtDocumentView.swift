//
//  ContentView.swift
//  EmojiArt
//
//  Created by Mateusz on 23/06/2026.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack {
                    ForEach(EmojiArtDocument.pallete.map {String($0)}, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: defaultEmojiSize))
                    }
                }
            }.padding(.horizontal)
            Rectangle().foregroundStyle(.yellow).edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
    private let defaultEmojiSize: CGFloat = 40
}


//#Preview {
//    EmojiArtDocumentView()
//}
