//
//  BlueButtonBig.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

//Шаблон для синей кнопки по всей ширине экрана
struct BlueButtonBig: View {
    var text = ""
    var body: some View {
        Text(text)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(hex: 0x0D72FF, alpha: 1))
                    .frame(width: UIScreen.main.bounds.size.width-36, height: 48))
    }
}
