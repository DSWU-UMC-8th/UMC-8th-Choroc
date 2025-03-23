//
//  SplashView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 3/23/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("primaryColor")
            VStack{
                Spacer().frame(height:394)
                logoGroup
                Spacer().frame(height:394)
            }
            
        }
        .ignoresSafeArea()
    }
    
    private var logoGroup: some View {
        HStack {
            Spacer().frame(width: 136)
            Image(.logo)
                .resizable()
                .frame(width:168, height: 168)
            Spacer().frame(width: 136)
        }
    }
}


#Preview {
    SplashView()
}


