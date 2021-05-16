//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/16.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView{
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                /**
                 Creates an instance that uniquely identifies and creates views across updates based on the provided key path to the underlying data’s identifier.
                 Available when Data conforms to RandomAccessCollection, ID conforms to Hashable, and Content conforms to View.
                */
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
