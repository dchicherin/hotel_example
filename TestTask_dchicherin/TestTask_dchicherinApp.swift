//
//  TestTask_dchicherinApp.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 14/12/2566 BE.
//

import SwiftUI

@main
struct TestTask_dchicherinApp: App {
    var hotelGetter = HotelGetter()
    var roomGetter = RoomGetter()
    
    var body: some Scene {
        WindowGroup {
            StartingPage().onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
