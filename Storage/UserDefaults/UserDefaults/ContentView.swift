//
//  ContentView.swift
//  UserDefaults
//
//  Created by 김소진 on 10/26/24.
//

import SwiftUI

// 다크모드랑 일반모드 배경 다르게 출력하기
// 기본 정보 적은 후 저장되기 --> 만약에 폰트 크기나 폰트 같은거 앱에서 설정하면 그거 저장해서 앱 접속했을때 자동으로 반영되는거
// 마지막에 접속한 화면 저장하기

/*
 화면을 뭐뭐 만들어야할까욤
 1. 배경화면은 다크모드 확인해서 정해주고
 2. 마지막에 접속한 화면 저장은 1,2 화면 만들어서 나갔다 들어왔을때도 유지 되는거 확인하면되고
 3. 기본정보?? 처음 들어왔을때는 이름 물어보기 -> 두번째 들어왔을때는 ~~님 안녕하세요 띄우기
 
 홈을 만들어서
 1번 버튼은 시간 보기
 2번 버튼은 이름 설정
 해놓고 진행해야할듯 ㅇㅇ
 
 => 처음 들어왔을때는
 안녕하세요
 이름을 알려주세요
 --------------
 textView
 
 저장
 => 저장 누르면 아래 텍스트로 변경됨
 
 => 두번째 들어왔을 때
 안녕하세요
 ~~님
 
 시간 보기 버튼? -> 뭐할지 생각해보기
 
 => 시간보기 버튼 눌렀을때
 
 시간 HH:MM:SS
 -> 이 화면에서 종료시키고 다시 들어왔을때도 유지되어있는지 확인
 
 */
struct ContentView: View {
    // 마지막 화면 저장
    @State private var selectedTab: Int = UserDefaults.standard.integer(forKey: "SelectedTab")
    @State private var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode")
        
    
    
    var body: some View {
        //selection: $selectedTab
        TabView() {
            NameView(backgroundColor: backgroundColor, textColor: textColor)
                .tabItem {
                    Label("이름 설정", systemImage: "person.fill")
                }
                .tag(0)
                .onAppear {
                    saveSelectedTab(0)
                }
            
            // 두 번째 탭: TimeView
            TimeView(backgroundColor: backgroundColor, textColor: textColor)
                .tabItem {
                    Label("현재 시간", systemImage: "clock.fill")
                }
                .tag(1)
                .onAppear {
                    saveSelectedTab(1)
                }
            
            ModeView(isDarkMode: $isDarkMode)
                .tabItem {
                    Label("설정", systemImage: "gearshape.fill")
                }
            
        }
        .onAppear {
            loadSelectedTab()
        }
        
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    private func saveSelectedTab(_ tab: Int) {
        UserDefaults.standard.set(tab, forKey: "SelectedTab")
    }
    
    private func loadSelectedTab() {
        selectedTab = UserDefaults.standard.integer(forKey: "SelectedTab")
    }
    
    private var backgroundColor: Color {
        isDarkMode == true ? Color.black : Color.white
    }
    
    private var textColor: Color {
        isDarkMode == true ? Color.white : Color.black
    }
    
}

#Preview {
    ContentView()
}
