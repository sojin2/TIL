//
//  StateProperty.swift
//  SwiftUI_PropertyWrapper
//
//  Created by 김소진 on 2022/12/09.
//

import SwiftUI

// MARK: - @State
struct SegementedControlView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedIndex) {
                Text("A").tag(0)
                Text("B").tag(1)
                Text("C").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}

struct StateProperty_Previews: PreviewProvider {
    static var previews: some View {
        SegementedControlView()
    }
}
