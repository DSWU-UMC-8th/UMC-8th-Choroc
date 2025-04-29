//
//  HomeViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import SwiftUI


class HomeViewModel: ObservableObject{
    let coffeeMenuModel: [MenuModel] = [
        .init(menuName: "에스프레소 콘 파나", menuImg: .init(.conpanna)),
        .init(menuName: "에스프레소 마끼아또", menuImg: .init(.macchiato)),
        .init(menuName: "아이스 카페 아메리카노", menuImg: .init(.americano)),
        .init(menuName: "카페 아메리카노", menuImg: .init(.hotAmericano)),
        .init(menuName: "아이스 카라멜 마끼아또", menuImg: .init(.caramel)),
        .init(menuName: "카라멜 마끼아또", menuImg: .init(.hotCaramel))
    ]
    
    let newsModel: [NewsModel] = [
        .init(title: "25년 3월 일회용컵 없는 날 캠페..", img: .init(.noDisposal), description: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        .init(title: "스타벅스 ooo점을 찾습니다", img: .init(.findStarbucks), description: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."),
        .init(title: "2월 8일, 리저브 스프링 신규 커...", img: .init(.reserveSpring), description: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
    ]
    
    let dessertMenuModel: [MenuModel] = [
        .init(menuName: "너티 크루아상", menuImg: .init(.nutty)),
        .init(menuName: "매콤 소시지 불고기", menuImg: .init(.spicy)),
        .init(menuName: "미니 리프 파이", menuImg: .init(.miniLeaf)),
        .init(menuName: "뺑 오 쇼콜라", menuImg: .init(.bbang)),
        .init(menuName: "소시지&올리브 파이", menuImg: .init(.olive)),
    ]
}
