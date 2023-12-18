//
//  RoomGetter.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 15/12/2566 BE.
//

import Foundation

class RoomGetter: ObservableObject {
    @Published var rooms : RoomsList?
    @Published var status = Statuses.loading
    func getHotels() {
        guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else { fatalError("Missing URL") }
    

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
                        let decodedRooms = try JSONDecoder().decode(RoomsList.self, from: data)
                        self.rooms = decodedRooms
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
