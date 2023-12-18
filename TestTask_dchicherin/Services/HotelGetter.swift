//
//  Network.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 14/12/2566 BE.
//

import Foundation
import SwiftUI

enum Statuses {
    case loading
    case ok
    case error
}

class HotelGetter: ObservableObject {
    @Published var hotels: Hotel?
    @Published var status = Statuses.loading
    func getHotels() {
        guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else { fatalError("Missing URL") }
    

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                self.status = .error
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedHotel = try JSONDecoder().decode(Hotel.self, from: data)
                        self.hotels = decodedHotel
                        self.status = .ok
                    } catch let error {
                        print("Error decoding: ", error)
                        self.status = .error
                    }
                }
            }
        }

        dataTask.resume()
    }
}
