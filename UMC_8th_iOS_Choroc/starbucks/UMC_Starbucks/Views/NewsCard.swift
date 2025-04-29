//
//  NewsCard.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import SwiftUI

struct NewsCard: View {
    let newsModel: NewsModel
    
    init(newsModel: NewsModel) {
        self.newsModel = newsModel
    }
    
    var body: some View {
        VStack(alignment: .leading){
            newsModel.img
                .resizable()
                .frame(width: 242, height: 160)
                .cornerRadius(5)
            
            Spacer().frame(height: 16)

            Text(newsModel.title)
                .font(.mainTextSemibold18)
            
            Spacer().frame(height: 9)
            
            Text(newsModel.description)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("gray03"))
        }
        .frame(width: 240, height: 249)
    
    }
}
