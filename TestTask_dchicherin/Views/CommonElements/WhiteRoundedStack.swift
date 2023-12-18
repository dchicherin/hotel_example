//
//  WhiteRoundedStack.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

//Для отображения блоков
struct WhiteRoudedStack <Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading,spacing:16) {
                content()
            }
            .cornerRadius(10)
            .padding(16)
            
        }.background(Rectangle().fill(Color.white).cornerRadius(20))
    }
}
