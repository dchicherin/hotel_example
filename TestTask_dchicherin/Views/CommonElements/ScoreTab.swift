//
//  ScoreTab.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct ScoreTab: View {
    var ratingName : String
    var rating : String
    
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Image(systemName: "star.fill")
                .foregroundStyle(K.orangeText)
            Text(rating)
                .foregroundStyle(K.orangeText)
            
            Text(ratingName)
                .foregroundStyle(K.orangeText)
        }.fixedSize(horizontal: false, vertical: false)
            .multilineTextAlignment(.leading)
            .padding(8)
            .background(Rectangle().fill(Color(hex: 0xFFC700, alpha: 0.2)).cornerRadius(5))
    }
}
