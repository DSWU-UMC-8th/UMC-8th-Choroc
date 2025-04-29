//
//  CoffeeModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/7/25.
//

import SwiftUI
import Foundation

struct CoffeeModel: Identifiable, Hashable {
    let id = UUID()
    var kor_name: String
    var eng_name: String
    var description: String
    var price: Int
    var imgName: String
    var temp: temperature
    
    enum temperature: String, Hashable {
        case HOT
        case ICED
        case HOT_ONLY
        case ICED_ONLY
    }
}
