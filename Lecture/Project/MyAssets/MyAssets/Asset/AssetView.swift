//
//  AssetView.swift
//  MyAssets
//
//  Created by 김소진 on 2022/10/20.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer() // 유연하게 위치 확장
                    AssetMenuGridView()
                    AssetBannerView().aspectRatio(5/2, contentMode: .fit )
                    AssetSummaryView().environmentObject(AssetSummaryData())
                    
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarWithButtonStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}

