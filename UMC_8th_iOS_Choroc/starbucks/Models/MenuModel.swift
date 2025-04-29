//
//  MenuModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/6/25.
//

import Foundation
import SwiftUI

struct MenuModel: Identifiable{
    let id = UUID()
    var menuName: String
    var menuImg: Image
}
