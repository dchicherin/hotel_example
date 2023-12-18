//
//  BookingTextPair.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct BookingPair: View {
    var condition : String
    var conditionValue: String
    var body: some View {
        HStack(alignment: .top){
            Text(condition )
                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(conditionValue)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
