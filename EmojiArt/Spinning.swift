//
//  Spinning.swift
//  EmojiArt
//
//  Created by Mateusz on 28/06/2026.
//

import SwiftUI

struct Spinning: ViewModifier {
    
    @State var isVisible: Bool = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisible ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isVisible)
            .onAppear(perform: { self.isVisible = true })
    }
}

extension View {
    func spinning() -> some View {
        self.modifier(Spinning())
    }
}
