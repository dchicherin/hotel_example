//
//  HotelDataStruct.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 14/12/2566 BE.
//

import Foundation

struct Hotel: Decodable, Identifiable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: AboutTheHotel
    
    struct AboutTheHotel: Decodable {
        let description: String
        let peculiarities: [String]
    }
}
