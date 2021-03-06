//
//  ContentView.swift
//  Migli
//
//  Created by Roger Kreienbuehl on 18.09.20.
//  Copyright © 2020 Roger Kreienbuehl. All rights reserved.
//

import SwiftUI
import RealityKit
import SDWebImageSwiftUI


struct ContentView : View {
    var body: some View {
        return StartScreen()
    }
}

struct StartScreen : View {
    @State var showAssistantView = false
    @State var isActive = false
    @State var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: VideoPlayer(), isActive: self.$isActive) {
                    EmptyView()
                }.hidden()
               
                VStack {
                    
                    HStack{
                        Image("ai").resizable().padding(.trailing).frame(width:300,height:300)
                    }
                    
                    Spacer()
                 
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showAssistantView.toggle()
                        }) {
                            Image("migli-smile")
                                .renderingMode(.original)
                        }
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 5)
                            .padding()
                    }
                }
            }
            .foregroundColor(Color("MigrosOrange"))
        }.sheet(isPresented: $showAssistantView, onDismiss: {
            print("dismiss")
        }) {
            AssistantView(showAssistantView: self.$showAssistantView, showNavigationView: self.$isActive)
        }
    }

}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
