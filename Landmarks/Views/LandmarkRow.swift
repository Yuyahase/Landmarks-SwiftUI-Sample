//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import SwiftUI

struct LandmarkRow: View {
    //Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        //Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.
        Group {
            //When you add the landmark property, the preview stops working, because the LandmarkRow type needs a landmark instance during initialization.
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        //Use the previewLayout(_:) modifier to set a size that approximates a row in a list.
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
