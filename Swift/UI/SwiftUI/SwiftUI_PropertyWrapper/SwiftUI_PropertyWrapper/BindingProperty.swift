//
//  BindingProperty.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 김소진 on 2022/12/09.
//

import SwiftUI


// MARK: - @ObservedObject
class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress
    
    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }.buttonStyle(.bordered)
    }
}


struct ProgressView: View {
    @StateObject var progress = UserProgress()
    
    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
    }
}

struct BindingProperty_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
