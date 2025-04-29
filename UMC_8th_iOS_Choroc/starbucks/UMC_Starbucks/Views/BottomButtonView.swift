//
//  BottomButtonView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/9/25.
//

import SwiftUI

struct BottomButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("주문하기")
            }) {
                Text("주문하기")
                    .padding()
                    .frame(width: 383, height: 43)
                    .font(.mainTextRegular18)
                    .background(Color("primaryColor"))
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
        }
        .frame(width: 439, height: 72)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 7, x: 0, y: -3)
    }
}
