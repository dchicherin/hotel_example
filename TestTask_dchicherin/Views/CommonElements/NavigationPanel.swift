//
//  NavigationPanel.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

//Верхняя навигационная панель
struct NavigationPanel: View {
    var hotelName: String?
    var presentationP: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .leading) {
            Button(action: {
                self.presentationP.wrappedValue.dismiss()
            }) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .padding(10)
            }
            Spacer()
            Text(hotelName ?? "Loading")
                .frame(maxWidth: .infinity)
                .fontWeight(.semibold)
                .font(.system(size: 22))
                .padding(.horizontal, 60)
        }.frame(maxWidth: .infinity)
    }
}
