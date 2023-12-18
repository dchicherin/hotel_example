//
//  BookingGetter.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 16/12/2566 BE.
//

import Foundation
class BookingGetter: ObservableObject {
    @Published var booking : Booking?
    @Published var status = Statuses.loading
    func getBooking() {
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else { fatalError("Missing URL") }
    

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
                        let decodedBooking = try JSONDecoder().decode(Booking.self, from: data)
                        self.booking = decodedBooking
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
