//
//  TouristModel.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 17/12/2566 BE.
//

import Foundation

struct Tourist: Hashable {
    static func == (lhs: Tourist, rhs: Tourist) -> Bool {
        return lhs.touristNumber == rhs.touristNumber
    }
    
    var name = ""
    var nameError = false
    var surname = ""
    var surnameError = false
    var birthDate: Date?
    var birthDateError = false
    var citizenship = ""
    var citizenshipError = false
    var passNumber = ""
    var passNumberError = false
    var validThrough: Date?
    var validThroughError = false
    var touristNumber = ""
    var showFullInfo = false
}

class TouristModel: ObservableObject{
    @Published var tourists: [Tourist]

    init(){
        self.tourists = [Tourist(touristNumber: "Первый турист",showFullInfo: true)]
    }
    func checkTourists() -> Bool{
        var passed = true
        for i in 0..<tourists.count {
            if tourists[i].name == "" {
                tourists[i].nameError = true
                passed = false
            }
            if tourists[i].surname == "" {
                tourists[i].surnameError = true
                passed = false
            }
            if tourists[i].birthDate == nil {
                tourists[i].birthDateError = true
                passed = false
            }
            if tourists[i].passNumber == "" {
                tourists[i].passNumberError = true
                passed = false
            }
            if tourists[i].validThrough == nil {
                tourists[i].validThroughError = true
                passed = false
            }
            if tourists[i].citizenship == "" {
                tourists[i].citizenshipError = true
                passed = false
            }
            if !passed {
                tourists[i].showFullInfo = true
            }
        }
        return passed
    }
    
    func getNextTouristNumber() -> String{
        switch tourists.count {
        case 1:
            return "Второй турист"
        case 2:
            return "Третий турист"
        case 3:
            return "Четвертый турист"
        default:
            return((tourists.count + 1).description + " турист")
            
        }
    }
}
