//
//  BookingStruckture.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 16/12/2566 BE.
//

import Foundation

struct Booking: Codable {
    let id: Int
    let hotel_name: String
    let hotel_adress: String
    let horating: Int
    let rating_name: String
    let departure: String
    let arrival_country: String
    let tour_date_start: String
    let tour_date_stop: String
    let number_of_nights: Int
    let room: String
    let nutrition: String
    let tour_price: Int
    let fuel_charge: Int
    let service_charge: Int
    
    func getFullPrice() -> Int{
        return tour_price + fuel_charge + service_charge
    }
}
class BookingModel: ObservableObject{
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var showPhone = false
    @Published var emailIsvalid = true
    @Published var phoneError = false
    @Published var ordernum = 0
    
    func generateOrderNumber() -> Int{
        let defaults = UserDefaults.standard
        var currentVal: Int = defaults.object(forKey: "Ordernumber")  as? Int ?? 0
        currentVal += 1
        defaults.setValue(currentVal, forKey: "Ordernumber")
        return currentVal
    }
    func checkFields() -> Bool {
        var passed = true
        checkEmail()
        if email == "" || !emailIsvalid {
            self.emailIsvalid = false
            passed = false
        }
        if phone == "" {
            self.phoneError = true
            passed = false
        }
        
        return passed
    }
    func phoneMasked() -> String {
        let mask = "**********"
        var dots = ""
        if phone.count > 10{
            dots = phone
        } else {
            dots = phone + mask.suffix(mask.count - phone.count)
        }
        var res =  "+7 (" + dots.prefix(3) + ") " + dots.prefix(6).suffix(3)
        res = res + "-" + dots.suffix(4).prefix(2) + "-" + dots.suffix(2)
        return res
    }
    func checkEmail(){
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPred.evaluate(with: email){
            emailIsvalid = false
        }
    }
}
