//
//  PaletteChooser.swift
//  EmojiArt
//
//  Created by Mateusz on 28/06/2026.
//

import SwiftUI

struct PaletteChooser: View {
    @ObservedObject var document: EmojiArtDocument
    
    @Binding var chosenPalette: String
    @State private var showPaletteEditor: Bool = false
    
    var body: some View {
        HStack {
            Stepper(onIncrement: {
                self.chosenPalette = self.document.palette(after: self.chosenPalette)
                
            }, onDecrement: {
                self.chosenPalette = self.document.palette(before: self.chosenPalette)
                
            }, label: {EmptyView()})
            Text(self.document.paletteNames[self.chosenPalette] ?? "")
            Image(systemName: "keyboard").imageScale(.large)
                .onTapGesture { showPaletteEditor = true }
                .popover(isPresented: $showPaletteEditor) {
                    PaletteEditor(chosenPalette: $chosenPalette)
                        .environmentObject(self.document)
                        .frame(minWidth: 300, minHeight: 500)
                }
        }
        .fixedSize(horizontal: true, vertical: false)

    }
}

struct PaletteEditor: View {
    
    @EnvironmentObject var document: EmojiArtDocument
    @Binding var chosenPalette: String
    @State private var paletteName: String = ""
    
    var body: some View {
        VStack {
            Text("PaletteEditor").font(.headline) // static var of a struct Font of type Font
                .padding()
            Divider()
            TextField("Palette name",text: $paletteName, onEditingChanged: {began in
                if !began {
                    self.document.renamePalette(self.chosenPalette, to: self.paletteName)
                }
            } )
                .padding()
            Spacer()
        }
        .onAppear(){ self.paletteName = self.document.paletteNames[self.chosenPalette] ?? ""}
    }
}




struct PaletteChooserPreviewWrapper: View {
    @State private var chosenPalette = ".faces"
    
    var body: some View {
        PaletteChooser(document: EmojiArtDocument(), chosenPalette: $chosenPalette)
    }
}
#Preview {
    PaletteChooserPreviewWrapper()
}
