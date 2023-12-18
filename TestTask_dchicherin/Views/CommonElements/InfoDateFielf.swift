//
//  InfoDateFielf.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 18/12/2566 BE.
//

import Foundation
import SwiftUI

struct InfoDateField: View {
    var name: String
    @Binding var field: Date?
    var onEnter = {}
    var onLeave = {}
    var bgColor = 0xF6F6F9
    var alpha = 1.0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 2)
            Text(field == nil ? " " : name)
                .font(.system(size:12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .foregroundStyle(Color(hex: 0xA9ABB7))
                
            Spacer(minLength: 1)
            /*TextField(name, text: $field, onEditingChanged: { (editingChanged) in
                if editingChanged {
                    onEnter()
                } else {
                    onLeave()
                }
                
            })*/
            DatePickerInputView(date: $field, placeholder: name)
                .onTapGesture {
                    onEnter()
                }
                .padding(.horizontal, 10)
            Spacer(minLength: 16)
        }.background(Rectangle().fill(Color(hex: UInt(bgColor), alpha: alpha)).cornerRadius(10))
    }
}
