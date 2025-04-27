//
//  CoffeeDetailView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/7/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    @Environment(\.dismiss) var dismiss
    let coffeeDetail: CoffeeModel
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                topCoffeeInfoGroup
                Spacer().frame(height: 20)
                coffeeDetailGroup
            }
            Spacer() // 화면 아래쪽에 고정
            BottomButtonView()
            Spacer().frame(height: 14)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
    
    private var topCoffeeInfoGroup: some View {
        ZStack{
            
            Image(coffeeDetail.imgName)
                .resizable()
                .frame(width: 440, height: 355)
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image(.back)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                
                Spacer()
                
                Button(action: {
                    print("공유하기!")
                }) {
                    Image(.share)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .padding([.leading, .trailing], 8)
            .padding(.bottom, 270)
        }
    }
    
    private var coffeeDetailGroup: some View{
        VStack(alignment: .leading){
            HStack {
                Text(coffeeDetail.kor_name)
                    .font(.mainTextSemibold24)
                Spacer().frame(width: 4)
                Image(.new)
                    .resizable()
                    .frame(width: 20, height: 10)
            }
            Text(coffeeDetail.eng_name)
                .font(.mainTextSemibold14)
                .foregroundStyle(Color("gray01"))
            
            Spacer().frame(height: 32)
            
            Text(coffeeDetail.description)
                .font(.mainTextSemibold14)
                .foregroundStyle(Color("gray06"))
            
            Spacer().frame(height: 20)
            
            Text("\(coffeeDetail.price)원")
                .font(.mainTextBold24)
            
            Spacer().frame(height: 32)
            
            TemperatureButton(selected: coffeeDetail.temp)
            
        }
        .padding([.leading, .trailing], 10)
    }
}


