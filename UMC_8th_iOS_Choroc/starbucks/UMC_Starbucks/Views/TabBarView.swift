//
//  tabView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//
import SwiftUI


struct TabBarView: View {
    @State private var showPopup = false
    
    var body: some View {
        TabView {
            Tab("Home", image: "home"){
                HomeView(showPopup: $showPopup)
            }
            Tab("Pay", image: "pay"){}
            Tab("Order", image: "order"){}
            Tab("Shop", image: "shop"){
                ShopView()
            }
            Tab("Other", image: "other"){
                OtherView()
            }
        }
        .tint(Color("primaryColor"))
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
            
        }
        .fullScreenCover(isPresented: $showPopup) {
            PopUpView(isPopupClosed: $showPopup)
        }
    }
}

#Preview{
    TabBarView()
}
