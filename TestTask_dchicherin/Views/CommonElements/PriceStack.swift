//
//  PriceStack.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct PriceStack: View {
    var minPrice: String?
    var priceFor: String?
    var body: some View {
        HStack(alignment: .bottom){
            Text("от \(minPrice ?? "0") ₽")
                .bold()
                .font(.system(size: 28))
            
            Text(self.priceFor?.lowercased() ?? "")
                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                .font(.system(size: 14))
        }
    }
}
