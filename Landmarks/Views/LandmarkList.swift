//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import SwiftUI

struct LandmarkList: View {
    /**
    @EnvironmentObject
    @EnvironmentObjectを付与したプロパティは複数のViewで共通のインスタンスを参照します。
    アプリ全体で共通のプロパティとなる。
     */
    @EnvironmentObject var modelData: ModelData
    /**
    @State
    structであるため保持するプロパティを変更できない。
    @Stateを付与したプロパティはメモリ管理がSwiftUIに委譲され、変更が可能になる。
    プロパティは値の変更が監視され、変更時に宣言されたViewのbodyが再描画される。
     */
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                
                //You use the $ prefix to access a binding to a state variable, or one of its properties.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                //xcrun simctl list devicetypesでpreviewDeviceできるデバイスを表示
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
