//
//  OtherView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//

import SwiftUI

struct OtherView:View{
    @StateObject private var viewModel = OtherViewModel()
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("appNickname") private var nickname: String = "(작성한 닉네임)"
    
    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()


    
    var body: some View{
        NavigationStack(path: $path){
            ZStack(alignment: .top){
                    ScrollView{
                        VStack{
                            topBackGroup
                            Spacer().frame(height:49)
                            customerInfoGroup
                            buttonGroup
                            Spacer().frame(height:49)
                            payButtonGroup
                            supportButtonGroup
                            Spacer().frame(height:100)
                            
                        }
                    }
                    .background(Color("background"))
                    .ignoresSafeArea()
                }
            .navigationDestination(for: String.self) { destination in
                if destination == "receipt" {
                    ReceiptView(modelContext: modelContext)
                }
            }
        }
        
    }
    
    private var topBackGroup: some View {
        VStack{
            Spacer().frame(height:40)
            HStack {
                Text("Other")
                    .font(.mainTextBold24)
                Spacer().frame(width: 298)
                
                Button(action: {
                    print("로그아웃 버튼 클릭됨")
                    isLoggedIn = false
                    print("로그인 상태: \(isLoggedIn)")
                }) {
                    Image(.logout)
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                    
            }
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(.white)
    }
    
    //상단 고객 관련 정보 - 환영
    private var customerInfoGroup: some View {
        VStack {
            Text(nickname+"님")
                .font(.mainTextSemibold24)
                .foregroundStyle(Color("primaryColor"))
            Text("환영합니다 🙌")
                .font(.mainTextSemibold24)
                .foregroundStyle(Color("mainBlack"))
            Spacer().frame(height:24)
        }
        
        
    }
    
    //상단 고객 관련 정보 - 버튼 그룹
    private var buttonGroup: some View {
        HStack(spacing: 10.5) {
            ForEach(viewModel.otherUserModel, id: \.name) { model in
                Button(action: {
                    if model.name == "전자영수증" {
                        path.append("receipt")
                    } else {
                        print("\(model.name)")
                    }
                }) {
                    ButtonView(otherUserModel: model)
                }
            }
        }
    }
    
    //Pay 메뉴
    private var payButtonGroup: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemibold18)
            ForEach(0..<((viewModel.otherPayModel.count + 1) / 2), id: \.self) { rowIndex in
                HStack {
                    // 첫 번째 아이템
                    let firstIndex = rowIndex * 2
                    BottomMenuView(otherPayModel: viewModel.otherPayModel[firstIndex])
                      
                    // 두 번째 아이템이 있을 경우만 표시
                    if firstIndex + 1 < viewModel.otherPayModel.count {
                        Spacer()
                        BottomMenuView(otherPayModel: viewModel.otherPayModel[firstIndex + 1])
                    }
                }
            }
            Divider()
            
        }
        .frame(width:418)
    }
    
    //Support 메뉴
    private var supportButtonGroup: some View{
        VStack(alignment: .leading) {
            Spacer().frame(height:49)
            Text("고객지원")
                .font(.mainTextSemibold18)
            ForEach(0..<((viewModel.otherSupportModel.count + 1) / 2), id: \.self) { rowIndex in
                HStack {
                    // 첫 번째 아이템
                    let firstIndex = rowIndex * 2
                    BottomMenuView(otherSupportModel: viewModel.otherSupportModel[firstIndex])
                      
                    // 두 번째 아이템이 있을 경우만 표시
                    if firstIndex + 1 < viewModel.otherSupportModel.count {
                        Spacer()
                        BottomMenuView(otherSupportModel: viewModel.otherSupportModel[firstIndex + 1])
                    }
                }
            }
            
        }
        .frame(width:418)
    }

}

struct ButtonView: View {
    let otherUserModel: OtherModel // 모델 가져오기
    
    init(otherUserModel: OtherModel) {
        self.otherUserModel = otherUserModel
    }
     
    var body: some View {
        VStack {
            otherUserModel.image
                .resizable()
                .frame(width: 48, height: 48)
            Text(otherUserModel.name)
                .font(.mainTextSemibold16)
                .foregroundColor(Color("mainBlack"))
        }
        .frame(width: 102, height: 108)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
    }
}

struct BottomMenuView: View{
    let otherModel: OtherModel

    init(otherPayModel: OtherModel) {
        self.otherModel = otherPayModel
    }
    
    init(otherSupportModel: OtherModel) {
        self.otherModel = otherSupportModel
    }
    
    var body: some View {
        
        Button(action: {
            print("\(otherModel.name)")
        }) {
            HStack{
                otherModel.image
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(otherModel.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color("mainBlack"))
            }
        }
        .frame(width: 159, height:32)
        .padding([.top, .bottom], 16)
        
    }
}


#Preview {
    OtherView()
}
