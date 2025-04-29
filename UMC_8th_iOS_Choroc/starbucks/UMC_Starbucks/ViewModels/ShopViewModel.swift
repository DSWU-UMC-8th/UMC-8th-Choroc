//
//  ShopViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/28/25.
//

import Foundation
import SwiftUI

class ShopViewModel: ObservableObject {
    let allProductModel: [ShopModel] = [
        .init(prodName: "텀블러", prodImg: .init(.tumbler)),
        .init(prodName: "커피 용품", prodImg: .init(.coffeeStuff)),
        .init(prodName: "선물세트", prodImg: .init(.giftSet)),
        .init(prodName: "보온병", prodImg: .init(.thermos)),
        .init(prodName: "머그/컵", prodImg: .init(.mug)),
        .init(prodName: "라이프스타일", prodImg: .init(.lifestyle)),
    ]
    
    let bestItemModel: [ShopModel] = [
        .init(prodName: "그린 사이렌 슬리브 머그 355ml", prodImg: .init(.sleeveMug)),
        .init(prodName: "그린 사이렌 클래식 머그 355ml", prodImg: .init(.sirenMug)),
        .init(prodName: "사이렌 머그 앤 우드 소서", prodImg: .init(.woodMug)),
        .init(prodName: "리저브 골드 테일 머그 355ml", prodImg: .init(.goldMug)),
        .init(prodName: "블랙 앤 골드 머그 473ml", prodImg: .init(.blackMugBig)),
        .init(prodName: "블랙 링 머그 355ml", prodImg: .init(.ringMug)),
        .init(prodName: "북청사자놀음 데미머그 89ml", prodImg: .init(.demiMug)),
        .init(prodName: "서울 제주 데미머그 세트", prodImg: .init(.demiMugSet)),
    ]
    
    let newProductModel: [ShopModel] = [
        .init(prodName: "그린 사이렌 도트 머그 237ml", prodImg: .init(.dotMug)),
        .init(prodName: "그린 사이렌 도트 머그 355ml", prodImg: .init(.dotMugBig)),
        .init(prodName: "홈 카페 미니 머그 세트", prodImg: .init(.miniMug)),
        .init(prodName: "홈 카페 글라스 세트", prodImg: .init(.glassSet)),
    ]
}
