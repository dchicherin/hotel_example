//
//  RoomDataStructure.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 15/12/2566 BE.
//

import Foundation

struct Room: Codable, Hashable {
    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id
    }
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}

struct RoomsList: Codable {
        let rooms: [Room]
}
