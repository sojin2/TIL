//
//  EnvironmentObjectProPerty.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 김소진 on 2022/12/09.
//

import SwiftUI

// EnvironmentObjectProPerty
struct ScoreView: View {
    @EnvironmentObject var progress: UserProgress
    
    var body: some View {
        Text("\(progress.score)")
    }
}

struct ContentViews: View {
    @EnvironmentObject var progress: UserProgress
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your score is \(progress.score)")
                InnerView(progress: progress)
                NavigationLink(destination: ScoreView()) {
                    Text("다음 View")
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct EnvironmentObjectProPerty_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews().environmentObject(UserProgress())
    }
}
