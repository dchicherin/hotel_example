//
//  SliderElement.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 14/12/2566 BE.
//

import Foundation
import SwiftUI

struct ImageSliderView: View {
    let images: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            Image(images[currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            HStack {
                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex - 1 + images.count) % images.count
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % images.count
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .font(.title)
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    let images = ["image1", "image2", "image3"]
    
    var body: some View {
        ImageSliderView(images: images)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
