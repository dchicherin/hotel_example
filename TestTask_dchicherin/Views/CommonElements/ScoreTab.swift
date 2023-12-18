//
//  ScoreTab.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

//Плашка с оценкой
struct ScoreTab: View {
    var ratingName : String
    var rating : String
    
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Image(systemName: "star.fill")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(K.orangeText)
            Text(rating)
                .foregroundStyle(K.orangeText)
                .font(.system(size: 16, weight: .semibold))
            Text(ratingName)
                .foregroundStyle(K.orangeText)
        }.fixedSize(horizontal: false, vertical: false)
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Rectangle().fill(Color(hex: 0xFFC700, alpha: 0.2)).cornerRadius(5))
    }
}
