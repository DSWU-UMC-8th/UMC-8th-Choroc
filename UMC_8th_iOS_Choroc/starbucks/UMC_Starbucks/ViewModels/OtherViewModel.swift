//
//  OtherViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//

import SwiftUI

class OtherViewModel: ObservableObject{
    let otherUserModel: [OtherModel] = [
        .init(name: "별 히스토리", image: .init(.starHistory)),
        .init(name: "전자영수증", image: .init(.receipt)),
        .init(name: "나만의 메뉴", image: .init(.my)),
    ]
    
    let otherPayModel: [OtherModel] = [
        .init(name: "스타벅스 카드 등록", image: .init(.card)),
        .init(name: "카드 교환권 등록", image: .init(.cardChange)),
        .init(name: "쿠폰 등록", image: .init(.coupon)),
        .init(name: "쿠폰 히스토리", image: .init(.conponHistory)),
    ]
    
    let otherSupportModel: [OtherModel] = [
        .init(name: "스토어 케어", image: .init(.storeCare)),
        .init(name: "고객의 소리", image: .init(.customer)),
        .init(name: "매장 정보", image: .init(.storeInfo)),
        .init(name: "반납기 정보", image: .init(.returnInfo)),
        .init(name: "마이 스타벅스 리뷰", image: .init(.myReview)),
    ]
}
