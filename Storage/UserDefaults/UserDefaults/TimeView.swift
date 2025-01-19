//
//  TimeView.swift
//  UserDefaults
//
//  Created by 김소진 on 11/2/24.
//

import SwiftUI

struct TimeView: View {
    @State private var currentTime: String = getCurrentTime()
    var onDisappearAction: (() -> Void)? = nil // 화면 종료 시 실행할 액션
    
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        VStack {
            Text("현재 시간")
                .font(.title)
                .padding(.bottom, 10)
                .foregroundColor(textColor)
            Text(currentTime)
                .font(.largeTitle)
                .foregroundColor(textColor)
                .onAppear {
                    currentTime = Self.getCurrentTime()
                }
        }
        .background(backgroundColor)
        .onDisappear {
            onDisappearAction?() // 화면 종료 시 마지막 화면 상태 저장
        }
    }

    private static func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
}
#Preview {
    TimeView(backgroundColor: Color.white, textColor: Color.black)
}
