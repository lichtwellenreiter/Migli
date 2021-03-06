//
//  LoadingDots.swift
//  Migli
//
//  Created by Florian Thiévent on 19.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI

struct LoadingDots: View {
    
    @State public var shouldAnimate: Bool = false
    
    var body: some View {
        HStack {
            Circle()
                .fill(ColorManager.migrosOrange)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            Circle()
                .fill(ColorManager.migrosOrange)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
            Circle()
                .fill(ColorManager.migrosOrange)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }
    
}
