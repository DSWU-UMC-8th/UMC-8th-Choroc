//
//  HomeView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var coffeeViewModel = CoffeeViewModel()
    @AppStorage("appNickname") private var optionalNickname: String?
    @State private var path = NavigationPath()
    let rewardRange: Int = 12
    
    var body: some View{
        NavigationStack(path: $path) {
            ScrollView{
                topBannerGroup
                
                adBannerGroup
                
                Spacer().frame(height: 20)
                
                recommendMenuGroup
                
                Spacer().frame(height: 20)
                
                middleGroup
                
                Spacer().frame(height: 20)
                
                newsBannerGroup
                
                Spacer().frame(height: 20)
                
                middleSecondGroup
                
                Spacer().frame(height: 20)
                
                dessertGroup
                
                Spacer().frame(height: 20)
                
                bottomEventBanner
                
                Spacer().frame(height: 100)
            }
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            
            .navigationDestination(for: CoffeeModel.self) { coffee in
                CoffeeDetailView(coffeeDetail: coffee)
            }
        }
    }
    
    // 상단 배너
    private var topBannerGroup: some View {
        VStack{
            ZStack(alignment: .leading){
                Image(.topImg)
                Text("골든 미모사 그린 티와 함께 \n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .padding(.top, 106)
                    .padding(.bottom, 48)
                    .padding(.leading, 28)
                    
                Text("11★ until next Reward")
                    .font(.mainTextSemibold16)
                    .padding(.top, 207)
                    .padding(.leading, 28)
                    .foregroundStyle(Color("brown02"))
                
                ProgressView(value: 1, total: Double(rewardRange))
                    .frame(width:255)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .tint(Color("brown01"))
                    .padding(.top, 248)
                    .padding(.leading, 28)
                
                HStack(spacing: 4){
                    Text("내용 보기")
                        .font(.mainTextRegular13)
                        .foregroundStyle(Color("gray06"))
                    Image(.goLine)
                        .resizable()
                        .frame(width:16, height:16)
                }
                .padding(.top, 180)
                .padding(.leading, 350)
                
                
                HStack(spacing: 5){
                    Text("1")
                        .font(.mainTextSemiBold38)
                    Text("/")
                        .font(.mainTextSemibold24)
                        .foregroundStyle(Color("lineGray"))
                    Text("12")
                        .font(.mainTextSemibold24)
                        .foregroundStyle(Color("brown02"))
                        .padding(.trailing, 0)
                    Text("★")
                        .font(.mainTextSemibold14)
                        .foregroundStyle(Color("brown02"))
                        .padding(.leading, -4)
                        .padding(.top, 8)
                }
                .padding(.top, 221)
                .padding(.leading, 320)
                
            }
        }
        .padding(.top, -20)
    }
    
    //광고 배너
    private var adBannerGroup: some View {
        Image(.adBanner)
            .resizable()
            .frame(width: 420, height: 183)
            .cornerRadius(4)
            .shadow(color: .black.opacity(0.06), radius: 1, x:1, y:4)
    }
    
    //유저 추천 메뉴
    private var recommendMenuGroup: some View {
            VStack(alignment: .leading){
                Text("\(optionalNickname ?? "(설정 닉네임)")")
                        .font(.mainTextBold24)
                        .foregroundStyle(Color("brown01"))
                + Text("님을 위한 추천 메뉴")
                    .font(.mainTextBold24)
                
                ScrollView(.horizontal, content: {
                    LazyHStack(spacing: 16, content: {
                        ForEach(viewModel.coffeeMenuModel) {menu in
                            if let matched: CoffeeModel = coffeeViewModel.coffeeMenuDetail.first(where: {coffee in
                                coffee.kor_name == menu.menuName
                            }){
                                    CircleImageCard(menuModel: menu)
                                    .onTapGesture {
                                        Task {
                                            print("Tapped: \(matched.kor_name)")
                                            path.append(matched)
                                        }
                                    }
                                
                            }
                            
                        }
                    })
                })
                .scrollIndicators(.hidden)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
        
    }
    
    //이벤트 배너 및 정규 서비스 론칭 배너
    private var middleGroup: some View{
        VStack {
            Image(.eventBanner)
                .resizable()
                .frame(width: 420, height: 451)
            
            Spacer().frame(height: 20)
            
            Image(.serviceSuscibe)
                .resizable()
                .frame(width: 420, height: 199)
        }
    }
    
    //뉴스 배너
    private var newsBannerGroup: some View{
        VStack(alignment: .leading){
             Text("What's New")
                .font(.mainTextBold24)
            ScrollView(.horizontal, content: {
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.newsModel) {new in
                        NewsCard(newsModel: new)
                    }
                })
            })
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
    
    //중간 세로 배너 두 번째 그룹
    private var middleSecondGroup: some View{
        VStack{
            Image(.mugBanner)
                .resizable()
                .frame(width: 420, height: 217)
                .shadow(color: .black.opacity(0.06), radius: 1, x: 1, y: 4)
            
            Spacer().frame(height: 14)
            
            ZStack(alignment: .leading){
                Image(.onlineBanner)
                    .resizable()
                    .frame(width: 420, height: 272)
                    .shadow(color: .black.opacity(0.06), radius: 1, x: 1, y: 4)
                
                VStack(alignment: .leading) {
                    Text("Tip")
                        .font(.mainTextRegular12)
                        .foregroundStyle(Color("gray02"))
                    Text("온라인 스토어\n별★ 적립 혜택")
                        .font(.mainTextBold24)
                    Spacer().frame(height: 16)
                    Text("온라인 스토어 구매 시\n별★을 적립해 드립니다.")
                        .font(.mainTextSemibold16)
                        .foregroundStyle(Color("gray02"))
                }
                .padding(.leading, 20)
                
            }
        }
    }
    
    //디저트 그룹
    private var dessertGroup: some View{
        VStack(alignment: .leading){
            Text("하루가 달콤해지는 디저트")
                .font(.mainTextSemibold24)
            
            Spacer().frame(height: 16)
            
            ScrollView(.horizontal, content: {
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.dessertMenuModel){dessert in
                        CircleImageCard(menuModel: dessert)
                    }
                    .scrollIndicators(.hidden)
                })
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
    
    //하단 이벤트 배너
    private var bottomEventBanner: some View{
        VStack{
            Image(.coldbrew)
                .resizable()
                .frame(width: 420, height: 182)
                .shadow(color: .black.opacity(0.06), radius: 1, x: 1, y: 4)
            
            Spacer().frame(width: 20)
            
            Image(.favorites)
                .resizable()
                .frame(width: 420, height: 360)
                .shadow(color: .black.opacity(0.06), radius: 1, x: 1, y: 4)
            
            Spacer().frame(width: 20)
            
            Image(.smileclub)
                .resizable()
                .frame(width: 420, height: 182)
                .shadow(color: .black.opacity(0.06), radius: 1, x: 1, y: 4)

        }
    }
}



#Preview {
    HomeView()
}
