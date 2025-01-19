//
//  ModeView.swift
//  UserDefaults
//
//  Created by 김소진 on 11/2/24.
//

import SwiftUI

struct ModeView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack {
            Text("앱 테마 설정")
                .font(.title)
                .padding(.bottom, 20)
            
            Button(action: {
                isDarkMode = false
                saveThemeSetting(isDarkMode: false)
            }) {
                Text("라이트 모드")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            Button(action: {
                isDarkMode = true
                saveThemeSetting(isDarkMode: true)
            }) {
                Text("다크 모드")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
        }
        .padding()
    }
    
    private func saveThemeSetting(isDarkMode: Bool) {
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }
}

//
//#Preview {
//    ModeView(isDarkMode: true)
//}
