//
//  IncludedBlock.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

//Блок с информацией и иконками
struct IncludedBlock: View {
    var imageName = "face.smiling"
    var text = "Удобства"
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .font(.system(size: 24))
            
            VStack(alignment: .leading) {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Самое необходимое")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: 0x2C3035, alpha: 1))
            }
            .frame(maxWidth: .infinity)
            Image(systemName: "chevron.forward")
                .font(.system(size: 24))
        }.frame(maxWidth: .infinity)
            .padding(10)
    }
}
