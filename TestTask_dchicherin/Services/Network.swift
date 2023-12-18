//
//  DI.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 16/12/2566 BE.
//

import Foundation

class Network {
    static let shared = Network()
    lazy var getBooking: BookingGetter = {
       return BookingGetter()
    }()
    lazy var getHotel: HotelGetter = {
       return HotelGetter()
    }()
    lazy var getRooms: RoomGetter = {
       return RoomGetter()
    }()
}
