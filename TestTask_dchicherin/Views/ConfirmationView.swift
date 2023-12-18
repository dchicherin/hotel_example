//
//  ConfirmationView.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 17/12/2566 BE.
//

import Foundation
import SwiftUI

struct ConfirmationView : View {
    @Environment(\.presentationMode) var presentation
    var hotelName = "Hotel"
    var orderNum = 0
    
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack {
                    
                    NavigationPanel(hotelName: "Заказ оплачен", presentationP: presentation)
                }
                .navigationBarBackButtonHidden(true)
                ZStack {
                    VStack(spacing: 16){
                        Text("🎉")
                            .font(.system(size: 50))
                            .background(Rectangle().cornerRadius(50).frame(width: 94, height: 94).foregroundColor(K.lightGreyBGColor))
                            .padding(.bottom, 22)
                        Text("Ваш заказ принят в работу")
                            .font(K.semiBoldFont)
                        Text("Подтверждение заказа №\(orderNum) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(K.greyTextColor)
                    }
                    .frame(maxHeight: .infinity)
                }.padding(23)
                
                HStack {
                    Button(action: { NavigationUtil.popToRootView() }) {
                        BlueButtonBig(text: "Супер")
                    }
                }
                
                .frame(maxWidth: .infinity, maxHeight: 88)
                .background(Rectangle().fill(Color(hex: 0xFFFFFF, alpha: 1)))
            }.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}
#Preview {
    ConfirmationView()
}
       
