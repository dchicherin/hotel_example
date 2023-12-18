//
//  ContentView.swift
//  TestTask_dchicherin
//
//  Created by Dmitry Chicherin on 14/12/2566 BE.
//

import SwiftUI

struct StartingPage: View {
    @ObservedObject var hotelGetter = Network.shared.getHotel
    
    init(){
        setupAppearance()
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    ZStack {
                        VStack(alignment: .leading,spacing:16) {
                            Text("Отель")
                                .font(K.semiBoldFont)
                                .frame(maxWidth: .infinity)
                            
                            ImageCarusel(urls: hotelGetter.hotels?.image_urls ?? [String]())
                            
                            ScoreTab(ratingName: hotelGetter.hotels?.rating_name ?? "loading", rating: hotelGetter.hotels?.rating.description ?? "loading")
                            Text(hotelGetter.hotels?.name ?? "")
                                .font(K.boldTitle)
                            Text(hotelGetter.hotels?.adress ?? "")
                                .foregroundStyle(Color(hex: 0x0D72FF, alpha: 1))
                                .font(.system(size: 14))
                            PriceStack(minPrice: hotelGetter.hotels?.minimal_price.description, priceFor: hotelGetter.hotels?.price_for_it)
                            Spacer()
                        }
                        
                        .cornerRadius(10)
                        .padding(16)
                        
                    }.background(Rectangle().fill(Color.white).cornerRadius(20, corners: [.bottomRight, .bottomLeft]))
                    
                    
                    
                    WhiteRoudedStack{
                        Text("Об отеле")
                            .bold()
                            .font(.system(size: 22))
                        TagCloud(tags: hotelGetter.hotels?.about_the_hotel.peculiarities ?? [String]())
                        Text(hotelGetter.hotels?.about_the_hotel.description ?? "")
                        VStack{
                            IncludedBlock(imageName: "face.smiling", text: "Удобства")
                            Divider()
                                .padding(.horizontal, 20)
                            IncludedBlock(imageName: "checkmark.square", text: "Что включено")
                            
                            Divider()
                                .padding(.horizontal, 20)
                            IncludedBlock(imageName: "multiply.square", text: "Что не включено")
                            
                        }.background(Rectangle().fill(K.lightGreyBGColor).cornerRadius(15))
                            .frame(maxWidth: .infinity)
                        
                    }
                    Spacer()
                }
                HStack {
                    NavigationLink {
                        RoomPickView(hotelName: hotelGetter.hotels?.name ?? "Hotel")
                    } label: {
                        BlueButtonBig(text: "К выбору номера")
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 88)
                .background(Rectangle().fill(Color.white))
            }
            .padding(.top, 1)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                hotelGetter.getHotels()
                setupAppearance()
            }
            .background(Rectangle().fill(K.lightGreyBGColor))
        }
        
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

#Preview {
    StartingPage()
}


