//
//  tabView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//
import SwiftUI


struct TabBarView: View {
    
    var body: some View {
        TabView {
            Tab("Home", image: "home"){
                HomeView()
            }
            Tab("Pay", image: "pay"){}
            Tab("Order", image: "order"){}
            Tab("Shop", image: "shop"){}
            Tab("Other", image: "other"){
                OtherView()
            }
        }
        .tint(Color("primaryColor"))
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

#Preview{
    TabBarView()
}
