//
//  TagCloud.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct TagCloud: View {
    var tags: [String]
    
    var body: some View {
        FlexibleView(
            data: tags, spacing: 8, alignment: .leading){ item in
                Text(verbatim: item)
                    .font(.system(size: 14))
                    .padding(8)
                    .foregroundStyle(K.greyTextColor)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(hex: 0xFBFBFC, alpha: 1))
                    )
            }
    }
}
