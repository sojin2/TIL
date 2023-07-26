//
//  CircleImage.swift
//  CreatingAndCombiningViews
//
//  Created by 김소진 on 2022/11/27.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {

        Image("hwaseong")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
