//
//  LoginView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 3/23/25.
//

import SwiftUI

struct LoginView: View {
    @FocusState var focusField: Field?
    
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("appEmail") private var savedId: String = ""
    @AppStorage("appPwd") private var savedPwd: String = ""
    
    @State private var id: String = ""
    @State private var pwd: String = ""

    enum Field: Hashable {
      case id
      case pwd
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer().frame(height: 104)
                
                mainTitleGroup
                Spacer().frame(height: 104)
                
                mainLoginGroup
                Spacer().frame(height: 104)
                
                bottomLoginGroup
                
                Spacer()
                
            }
            .frame(width: 402, height:751)
        }
        
    }
    
    ///상단 로고 및 설명 그룹
    private var mainTitleGroup: some View {
        VStack(alignment: .leading) {
            Image(.logo)
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer().frame(height: 28)
            
            Text("안녕하세요. \n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .foregroundStyle(Color("mainBlack"))
                .lineLimit(nil)
                .fixedSize()
            
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요.")
                .font(.mainTextMedium16)
                .foregroundStyle(Color("mainGray"))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /// 아이디 및 비밀번호 입력 필드
    private var mainLoginGroup: some View {
        VStack(alignment: .leading) {
            Text("아이디")
                .font(.mainTextRegular13)
                .foregroundStyle(Color("subBlack"))
    
                
            TextField("", text: $id)
                .frame(width: 401)
                .focused($focusField, equals: .id)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                
            
            Divider()
                .background(focusField == .id ? Color("primaryColor") : Color("lineGray"))
            
            Spacer().frame(height: 47)
            
            Text("비밀번호")
                .font(.mainTextRegular13)
                .foregroundStyle(Color("subBlack"))
                
            
            SecureField("", text: $pwd)
                .frame(width: 401)
                .focused($focusField, equals: .pwd)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            Divider()
                .background(focusField == .pwd ? Color("primaryColor") : Color("lineGray"))
            
            Spacer().frame(height: 47)
            
            Button(action: {
                print("입력한 id: \(id), 입력한 pwd: \(pwd)")
                print("저장된 id: \(savedId), 저장된 pwd: \(savedPwd)")
                print("로그인 시도 전 isLoggedIn: \(isLoggedIn)")

                if id == savedId && pwd == savedPwd {
                    isLoggedIn = true
                    print("✅ 로그인 성공")
                } else {
                    isLoggedIn = false
                    print("❌ 로그인 실패")
                }
                
                print("로그인 시도 후 isLoggedIn: \(isLoggedIn)")
            }) {
                Text("로그인하기")

                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 46)
                        .font(.mainTextMedium16)
                        .background(Color("primaryColor"))
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
                .frame(maxWidth: .infinity)
               
            
        }
    }
    
    /// 하단 로그인 프레임
    private var bottomLoginGroup: some View {
        VStack {
            NavigationLink(destination: SignupView()) {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color("subGray"))
                    .underline()
            }
                
            Spacer().frame(height: 19)
            Image(.kakao)
            Spacer().frame(height: 19)
            Image(.apple)
        }
    }
    
}

#Preview {
    LoginView()
}
