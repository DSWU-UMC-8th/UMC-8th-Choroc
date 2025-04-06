//
//  LoginViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 3/23/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
}
