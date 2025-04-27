//
//  SignupView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel = .init()
    @Environment(\.dismiss) var dismiss
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            Spacer().frame(height: 210)
            
            mainSignUpGroup
                .frame(width:402, height: 674)
            
            Spacer().frame(height: 72)
            
        }
    }
    
    
    private var mainSignUpGroup: some View {
        VStack{
            TextField("닉네임", text: $viewModel.appNickname)
                .font(.mainTextRegular18)
                .foregroundStyle(Color("gray00"))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            Divider()
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $viewModel.appEmail)
                .font(.mainTextRegular18)
                .foregroundStyle(Color("gray00"))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            Divider()
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $viewModel.appPwd)
                .font(.mainTextRegular18)
                .foregroundStyle(Color("gray00"))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            Divider()
            
            Spacer().frame(height: 428)
            
            Button(action: {
                if viewModel.appNickname.count < 1 || viewModel.appEmail.count < 1 || viewModel.appPwd.count < 1 {
                    errorMessage = "한 글자 이상 입력하세요."
                } else {
                    viewModel.storeUser()
                    
                    dismiss()
                }
                
            }) {
                Text("생성하기")
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 58)
                    .font(.mainTextRegular18)
                    .background(Color("primaryColor"))
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .navigationTitle("가입하기")
        .toolbarRole(.editor)
    }
    

}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
