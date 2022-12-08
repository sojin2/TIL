//
//  LandmarkDetail.swift
//  BuildingListsandNavigation
//
//  Created by 김소진 on 2022/11/28.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack{
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(landmark.description)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
