//
//  ContentView.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    //Opaque Return Type
    //ジェネリクスのようなもの
    //some Viewは具体的な型は公開しないけど、Viewプロトコルに適合した何らかの型
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
