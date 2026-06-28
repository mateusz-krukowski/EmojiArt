//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Mateusz on 28/06/2026.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

