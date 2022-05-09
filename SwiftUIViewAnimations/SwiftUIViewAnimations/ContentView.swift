//
//  ContentView.swift
//  SwiftUIViewAnimations
//
//  Created by Jon Corn on 5/8/22.
//

import SwiftUI

struct ContentView: View {
    // temporary holding space for view that'll animate
    @Namespace private var animation
    @State private var isZoomed = false
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if isZoomed == false {
                        Text("I drink a lot of water")
                            .font(.headline)
                            .matchedGeometryEffect(id: "Piss", in: animation)
                        
                        Spacer()
                    }
                }
                
                if isZoomed == true {
                    Text("I piss a lot of pee")
                        .font(.headline)
                        .matchedGeometryEffect(id: "Piss", in: animation)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    self.isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: isZoomed ? 400 : 60)
            .background(Color(white: 0.9))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
