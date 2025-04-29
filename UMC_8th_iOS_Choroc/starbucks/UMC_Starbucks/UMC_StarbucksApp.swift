//
//  UMC_StarbucksApp.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 3/23/25.
//

import SwiftUI

@main
struct UMC_StarbucksApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabBarView()
            } else {
                LoginView()
            }
        }
    }
}
