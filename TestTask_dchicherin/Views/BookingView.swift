//
//  BookingView.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 16/12/2566 BE.
//

import Foundation
import SwiftUI

struct BookingView: View {
    private enum Field: Int, Hashable {
        case email, phone
    }
    @Environment(\.presentationMode) var presentation
    @ObservedObject var bookingGetter = Network.shared.getBooking
    @ObservedObject var bookingModel = BookingModel()
    @StateObject var touristsModel = TouristModel()
    
    @State private var selection: String? = nil
    @FocusState private var focusedField: Field?
    
    var body: some View {
        
        NavigationStack {
            VStack {
                NavigationPanel(hotelName: "Бронирование", presentationP: presentation)
                ScrollView{
                    Spacer()
                    WhiteRoudedStack{
                        ScoreTab(ratingName: bookingGetter.booking?.horating.description ?? "loading", rating: bookingGetter.booking?.rating_name ?? "loading")
                        Text(bookingGetter.booking?.hotel_name ?? "")
                            .font(K.boldTitle)
                            .frame(maxWidth: .infinity)
                        Text(bookingGetter.booking?.hotel_adress ?? "")
                            .foregroundStyle(Color(hex: 0x0D72FF, alpha: 1))
                            .font(.system(size: 14))
                    }
                    WhiteRoudedStack{
                        BookingPair(condition: "Вылет из", conditionValue: bookingGetter.booking?.departure ?? "Loading")
                        BookingPair(condition: "Страна, город", conditionValue: bookingGetter.booking?.arrival_country ?? "Loading")
                        BookingPair(condition: "Даты", conditionValue: (bookingGetter.booking?.tour_date_start ?? "Loading") + (" - ") + (bookingGetter.booking?.tour_date_stop ?? "Loading"))
                        BookingPair(condition: "Кол-во ночей", conditionValue: (bookingGetter.booking?.number_of_nights.description ?? "Loading") + " ночей")
                        BookingPair(condition: "Отель", conditionValue: bookingGetter.booking?.hotel_name ?? "Loading")
                        BookingPair(condition: "Номер", conditionValue: bookingGetter.booking?.room ?? "Loading")
                        BookingPair(condition: "Питание", conditionValue: bookingGetter.booking?.nutrition ?? "Loading")
                    }
                    WhiteRoudedStack{
                        Text("Информация о покупателе")
                            .font(.system(size:22,weight: .bold))
                        VStack(spacing: 0) {
                            Spacer(minLength: 3)
                            Text(!bookingModel.showPhone && bookingModel.phone == "" ? " " : "Телефон")
                                .font(.system(size:12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 10)
                                .foregroundStyle(Color(hex: 0xA9ABB7))
                                .keyboardType(.numberPad)
                            Spacer(minLength: 1)
                            Button{
                                focusedField = .phone
                            } label: {
                                ZStack {
                                    TextField("Телефон", text: $bookingModel.phone, onEditingChanged: { (editingChanged) in
                                        if editingChanged {
                                            bookingModel.showPhone = true
                                            bookingModel.phoneError = false
                                        } else {
                                            if bookingModel.phone == ""{
                                                bookingModel.showPhone = false
                                            }
                                        }
                                    })
                                    .keyboardType(.phonePad)
                                    .focused($focusedField, equals: .phone)
                                    .padding(.horizontal, 10)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: bookingModel.showPhone == true ? 0 : .infinity, maxHeight: 20, alignment: .leading)
                                    Text(bookingModel.phoneMasked())
                                        .frame(maxWidth: bookingModel.showPhone == false ? 0 : .infinity, alignment: .leading)
                                        .padding(.horizontal, 10)
                                        .foregroundStyle(Color.black)
                                }.frame(maxHeight: 20)
                            }
                            Spacer(minLength: 20)
                        }.background(Rectangle().fill(bookingModel.phoneError ? Color(hex: 0xEB5757, alpha: 0.15) : K.lightGreyBGColor).cornerRadius(10))
                        
                        InfoTextField(name: "Почта", field: $bookingModel.email,onEnter: {bookingModel.emailIsvalid = true}, onLeave: {bookingModel.checkEmail()}, bgColor: bookingModel.emailIsvalid ? 0xF6F6F9 : 0xEB5757, alpha:  bookingModel.emailIsvalid ? 1.0 : 0.15, boardType: .emailAddress)
                        
                        Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанные вами номер и почту")
                            .font(.system(size:14))
                            .foregroundStyle(K.greyTextColor)
                        
                    }
                    ForEach(Array(touristsModel.tourists.enumerated()), id: \.offset){  index, element in
                        WhiteRoudedStack{
                            HStack{
                                Text(touristsModel.tourists[index].touristNumber)
                                    .font(.system(size:22,weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Button(action: {
                                    touristsModel.tourists[index].showFullInfo.toggle()
                                }) {
                                    Image(systemName: !touristsModel.tourists[index].showFullInfo ? "chevron.up" : "chevron.down")
                                        .foregroundStyle(Color(hex: 0x0D72FF))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(5)
                                        .background(Rectangle().fill(Color(hex: 0x0D72FF, alpha: 0.1)).cornerRadius(6).frame(width: 30, height: 30))
                                }
                                
                            }
                            !touristsModel.tourists[index].showFullInfo ? nil :
                            VStack(alignment: .leading, spacing: 8){
                                InfoTextField(name: "Имя", field: $touristsModel.tourists[index].name, onEnter:{touristsModel.tourists[index].nameError = false}, bgColor: touristsModel.tourists[index].nameError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].nameError ? 0.15 : 1.0)
                                
                                InfoTextField(name: "Фамилия", field: $touristsModel.tourists[index].surname, onEnter:{touristsModel.tourists[index].surnameError = false}, bgColor: touristsModel.tourists[index].surnameError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].surnameError ? 0.15 : 1.0)
                                
                                InfoDateField(name: "Дата рождения", field: $touristsModel.tourists[index].birthDate, onEnter:{touristsModel.tourists[index].birthDateError = false},bgColor: touristsModel.tourists[index].birthDateError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].birthDateError ? 0.15 : 1.0)
                                
                                InfoTextField(name: "Гражданство", field: $touristsModel.tourists[index].citizenship, onEnter:{touristsModel.tourists[index].citizenshipError = false}, bgColor: touristsModel.tourists[index].citizenshipError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].citizenshipError ? 0.15 : 1.0)
                                
                                InfoTextField(name: "Номер загранпаспорта", field: $touristsModel.tourists[index].passNumber, onEnter:{touristsModel.tourists[index].passNumberError = false}, bgColor: touristsModel.tourists[index].passNumberError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].passNumberError ? 0.15 : 1.0)
                                
                                InfoDateField(name: "Срок действия загранпаспорта", field: $touristsModel.tourists[index].validThrough, onEnter:{touristsModel.tourists[index].validThroughError = false},bgColor: touristsModel.tourists[index].validThroughError ? 0xEB5757 : 0xF6F6F9, alpha: touristsModel.tourists[index].validThroughError ? 0.15 : 1.0)
                            }
                        }
                    }
                    WhiteRoudedStack{
                        Button(action: {
                            touristsModel.tourists.append(Tourist(touristNumber: touristsModel.getNextTouristNumber()))
                        }) {
                            HStack{
                                Text("Добавить туриста")
                                    .font(K.boldTitle)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(Color.black)
                                Image(systemName: "plus")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(5)
                                    .background(Rectangle().fill(Color(hex: 0x0D72FF, alpha: 1)).cornerRadius(6).frame(width: 30, height: 30))
                            }
                        }
                    }
                    WhiteRoudedStack{
                        HStack{
                            Text("Тур")
                                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\((bookingGetter.booking?.tour_price ?? 0) * touristsModel.tourists.count) ₽")
                        }
                        HStack{
                            Text("Сервисный сбор")
                                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\((bookingGetter.booking?.service_charge ?? 0) * touristsModel.tourists.count) ₽")
                        }
                        HStack{
                            Text("Топливный сбор")
                                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\((bookingGetter.booking?.fuel_charge ?? 0) * touristsModel.tourists.count) ₽")
                        }
                        HStack{
                            Text("К оплате")
                                .foregroundStyle(Color(hex: 0x828796, alpha: 1))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\((bookingGetter.booking?.getFullPrice() ?? 0) * touristsModel.tourists.count) ₽")
                                .foregroundStyle(Color(hex: 0x0D72FF, alpha: 1))
                                .bold()
                            
                        }
                    }
                    Spacer()
                }.background(Rectangle().fill(K.lightGreyBGColor))
                
                HStack {
                    Button {
                        let bookingPassed = bookingModel.checkFields()
                        let tourisInfoPassed = touristsModel.checkTourists()
                        if  tourisInfoPassed && bookingPassed {
                            bookingModel.ordernum = bookingModel.generateOrderNumber()
                            selection = "A"
                        }
                    } label: {
                        BlueButtonBig(text: "Оплатить \((bookingGetter.booking?.getFullPrice() ?? 0) * touristsModel.tourists.count) ₽")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 88)
                .background(Rectangle().fill(Color(hex: 0xFFFFFF, alpha: 1)))
                NavigationLink(destination: ConfirmationView(orderNum: bookingModel.ordernum), tag: "A", selection: $selection) { EmptyView() }
            }.edgesIgnoringSafeArea(.bottom)
        }.onAppear{
            bookingGetter.getBooking()
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    BookingView()
}
