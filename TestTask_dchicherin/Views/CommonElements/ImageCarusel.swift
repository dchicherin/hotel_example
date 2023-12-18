//
//  ImageCarusel.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct ImageCarusel: View {
    var urls : [String]
    
    var body: some View {
        TabView {
            ForEach(urls, id: \.self) { item in
                AsyncImage(url: URL(string: item)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
            }
        }
        .frame(height: 257)
        .cornerRadius(15)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
