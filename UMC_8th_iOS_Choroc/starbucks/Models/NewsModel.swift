//
//  NewsModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import SwiftUI
import Foundation

struct NewsModel: Identifiable {
    let id = UUID()
    var title: String
    var img: Image
    var description: String
}
