//
//  ModelData.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import Foundation
import Combine

/**
 @Stateと似た状態管理。@ObservedObjectを利用すると、プロパティをひとまとめにしたオブジェクトとして管理できる。
 付与するオブジェクトはObservableObjectに準拠する必要がある。
 また監視するプロパティは@Publishedを付与する必要がある。
 */
final class ModelData: ObservableObject {
    //An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

//The load method relies on the return type’s conformance to the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }}
