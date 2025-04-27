//
//  CircleImageCard.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import SwiftUI

struct CircleImageCard: View {
    let menuModel: MenuModel
    
    init(menuModel: MenuModel) {
        self.menuModel = menuModel
    }
    
    var body: some View {
        VStack {
            menuModel.menuImg
                .resizable()
                .frame(width: 130, height: 130)
            Spacer().frame(height: 10)
            Text(menuModel.menuName)
                .font(.mainTextSemibold14)
        }
        .frame(width:130, height: 160)
    }
}
