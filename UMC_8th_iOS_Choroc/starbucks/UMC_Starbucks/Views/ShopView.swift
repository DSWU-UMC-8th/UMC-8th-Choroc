//
//  ShopView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/28/25.
//

import SwiftUI

struct ShopView: View {
    @StateObject private var shopViewModel = ShopViewModel()
    @State private var activePage: Int? = 0
    
    var body: some View {
        ScrollView(.vertical){
            VStack {
                Spacer().frame(height: 50)
                topBannerGroup
                Spacer().frame(height: 30)
                allProductGroup
                Spacer().frame(height: 30)
                bestItemGroup
                Spacer().frame(height: 30)
                newProductsGroup
                Spacer().frame(height: 100)
            }
        }
        .background(Color("background"))
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
    }
    
    private var topBannerGroup: some View {
        VStack(alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
                .padding(.top, 20)
                .padding([.leading, .trailing], 16)
            
            Spacer().frame(height: 16)
            
            ScrollView(.horizontal){
                LazyHStack(spacing: 28){
                    Image(.bannerVar1)
                        .resizable()
                        .frame(width: 270, height: 216)
                    Image(.bannerVar2)
                        .resizable()
                        .frame(width: 270, height: 216)
                    Image(.bannerVar3)
                        .resizable()
                        .frame(width: 270, height: 216)
                }
            }
            .padding([.leading, .trailing], 16)
            .scrollIndicators(.hidden)
        }
    }
    
    private var allProductGroup: some View {
        VStack(alignment: .leading) {
            Text("All Products")
                .font(.mainTextBold24)
                .padding([.leading, .trailing], 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17){
                    ForEach(shopViewModel.allProductModel) { prod in
                        VStack(spacing: 10){
                            prod.prodImg
                                .resizable()
                                .frame(width: 80, height: 80)
                            
                            
                            Text(prod.prodName)
                                .font(.mainTextSemibold14)
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 16)
            .scrollIndicators(.hidden)
        }
    }
    
    private var bestItemGroup: some View {
        VStack(alignment: .leading) {
            Text("Best Items")
                .font(.mainTextBold24)
            
            VStack {
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 20) {
                        ForEach(0..<numberOfPages, id: \.self) { pageIndex in
                            cardView(for: pageIndex)
                                .frame(width: 408, height: 470)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $activePage)
                .scrollIndicators(.never)
                
                Spacer().frame(height: 31)
                pagingControl
            }
        }
        .padding([.leading, .trailing], 16)
        .onAppear {
            activePage = 0
        }
    }
    
    private var numberOfPages: Int {
        (shopViewModel.bestItemModel.count + 3) / 4
    }
    
    func cardView(for pageIndex: Int) -> some View {
        VStack(spacing: 54) {
            ForEach(0..<2, id: \.self) { row in
                HStack(spacing: 65) {
                    ForEach(0..<2, id: \.self) { column in
                        let itemIndex = pageIndex * 4 + row * 2 + column
                        if itemIndex < shopViewModel.bestItemModel.count {
                            let product = shopViewModel.bestItemModel[itemIndex]
                            VStack(spacing: 12) {
                                product.prodImg
                                    .resizable()
                                    .frame(width: 157, height: 158)
                                    .cornerRadius(5)
                                
                                Text(product.prodName)
                                    .font(.mainTextSemibold14)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: 157, height: 208)
                        } else {
                            Spacer()
                                .frame(width: 157, height: 208)
                        }
                    }
                }
            }
        }
    }
    
    var pagingControl: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button {
                    withAnimation {
                        activePage = index
                    }
                } label: {
                    Image(systemName: activePage == index ? "circle.fill" : "circle")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Color("mainBlack"))
                }
            }
        }
    }
    
    private var newProductsGroup: some View {
        VStack(alignment: .leading) {
            Text("New Products")
                .font(.mainTextBold24)
                .padding(.leading, 16)
            
            Spacer().frame(height: 16)
            
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.fixed(157), spacing: 65), count: 2)
                ) {
                    ForEach(0..<shopViewModel.newProductModel.count, id: \.self) { index in
                        let product = shopViewModel.newProductModel[index]
                        
                        VStack(spacing: 12) {
                            product.prodImg
                                .resizable()
                                .frame(width: 157, height: 158)
                                .cornerRadius(5)
                            
                            Text(product.prodName)
                                .font(.mainTextSemibold14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(width: 157, height: 208)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }

}

#Preview {
    ShopView()
}
