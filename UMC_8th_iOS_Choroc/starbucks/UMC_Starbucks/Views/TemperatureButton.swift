//
//  TemperatureButton.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/14/25.
//
import SwiftUI

struct TemperatureButton: View {
    let selected: CoffeeModel.temperature

    var body: some View {
        if selected == .HOT_ONLY || selected == .ICED_ONLY {
            Button(action: {
                print("\(selected.rawValue) 선택됨")
            }) {
                Text(selected.rawValue)
                    .font(.headline)
                    .foregroundColor(selected == .HOT_ONLY ? .red : .blue)
                    .frame(width: 420, height: 36) 
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            .shadow(color: .black.opacity(0.05), radius: 1, x: 0, y: 0)
        } else {
                HStack(spacing: 0) {
                    ForEach([CoffeeModel.temperature.HOT, CoffeeModel.temperature.ICED], id: \.self) { type in
                        ZStack {
                            if selected == type {
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 36)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            }

                            Button(action: {
                                print("\(type.rawValue) 선택됨")
                            }) {
                                Text(type.rawValue)
                                    .font(.mainTextSemibold18)
                                    .foregroundColor(
                                        selected == type
                                        ? (type == .HOT ? Color("red01").opacity(0.63) : Color("blue01").opacity(0.63))
                                        : Color("gray02")
                                    )
                                    .frame(maxWidth: .infinity)
                                    .background(selected == type ? Color.clear : Color("gray07"))
                                
                            }
                            .disabled(true)
                        }
                    }
                }
                .frame(height: 36)
                .frame(maxWidth: .infinity)
                .background(Color("gray07"))
                .cornerRadius(999)
                .padding(.horizontal)
        }
    }
}
