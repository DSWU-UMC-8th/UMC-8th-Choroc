//
//  PopUpView.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//

import SwiftUI


struct PopUpView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPopupClosed: Bool
    
    var body: some View{
        
        VStack{
            Image(.popup)
                .frame(width: .infinity, height:720)
                .ignoresSafeArea()
            
            Spacer().frame(height:106)
            
            buttonGroup
            
            Spacer().frame(height:36)
            
            
        }
        
    }
    
    private var buttonGroup: some View {
        VStack(alignment: .trailing) {
            Button(action: {
                print("자세히 보기")
            }){
                Text("자세히 보기")
                    .padding()
                    .frame(maxWidth: 402, minHeight: 58)
                    .font(.mainTextRegular18)
                    .background(Color("primaryColor"))
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
            
            Spacer().frame(height:19)
            
            Button(action:{
                isPopupClosed = false
                dismiss()
            }){
                Text("X 닫기")
                    .font(.mainTextLight14)
                    .foregroundStyle(Color("subGray"))
                    .background(Color.clear)
            }
            .frame(width: 36, height: 17, alignment: .trailing)
            .padding(.trailing, 19)
        }
    }
}

#Preview {
    PopUpView(isPopupClosed: .constant(false))
}
