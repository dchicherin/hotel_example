//
//  RoomCard.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct RoomCard: View {
    let item : Room?
    var body: some View {
        WhiteRoudedStack{
            ImageCarusel(urls: item?.image_urls ?? [String]())
            Text(item!.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(K.boldTitle)
            TagCloud(tags: item?.peculiarities ?? [String]())
            HStack{
                Text("Подробнее о номере")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: 0x0D72FF))
                Image(systemName: "chevron.forward")
                    .foregroundStyle(Color(hex: 0x0D72FF))
            }
            .padding(8)
            .foregroundStyle(Color(hex: 0x828796, alpha: 1))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex: 0x0D72FF, alpha: 0.1))
            )
            PriceStack(minPrice: item?.price.description, priceFor: item?.price_per).padding(.bottom, 8)
            HStack {
                
                NavigationLink {
                    BookingView()
                } label: {
                    BlueButtonBig(text: "Выбрать номер")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 88)
            .background(Rectangle().fill(Color(hex: 0xFFFFFF, alpha: 1)))
            Spacer()
        }
    }
}


