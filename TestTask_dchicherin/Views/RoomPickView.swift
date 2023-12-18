//
//  RoomPickView.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 15/12/2566 BE.
//

import Foundation
import SwiftUI

struct RoomPickView: View {
    @ObservedObject var roomGetter = Network.shared.getRooms
    @Environment(\.presentationMode) var presentation
    var hotelName = "Hotel"
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationPanel(hotelName: hotelName, presentationP: presentation)
                ScrollView{
                    ForEach(roomGetter.rooms?.rooms ?? [Room](), id: \.self) {item in
                        RoomCard(item: item)
                    }
                }.background(Rectangle().fill(K.lightGreyBGColor))
                .edgesIgnoringSafeArea(.bottom)
            }
            
        }.onAppear{
            roomGetter.getHotels()
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    RoomPickView()
}
