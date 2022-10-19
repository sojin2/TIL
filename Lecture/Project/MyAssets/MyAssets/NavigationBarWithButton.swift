//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Created by 김소진 on 2022/10/20.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title).font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산추가버튼 tapped")
                    },
                    
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가").font(.system(size: 12))
                    }
                )
                .accentColor(.black)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black)
                )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearence = UINavigationBarAppearance()
                appearence.configureWithTransparentBackground()
                appearence.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance().standardAppearance = appearence
                UINavigationBar.appearance().compactAppearance = appearence
                UINavigationBar.appearance().scrollEdgeAppearance = appearence
            }
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.bottom)
                .navigationBarWithButtonStyle("내 자산")
        }
    }
}
