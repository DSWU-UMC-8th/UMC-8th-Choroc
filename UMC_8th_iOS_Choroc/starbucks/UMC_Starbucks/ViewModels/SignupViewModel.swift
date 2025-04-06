//
//  SignupViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/2/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var appNickname: String = ""
    @Published var appEmail: String = ""
    @Published var appPwd: String = ""
    
    @AppStorage("appNickname") private var nickname: String = ""
    @AppStorage("appEmail") private var email: String = ""
    @AppStorage("appPwd") private var pwd: String = ""
    
    
    public func storeUser() {
        appNickname = nickname
        appEmail = nickname
        appPwd = pwd
    }
}
