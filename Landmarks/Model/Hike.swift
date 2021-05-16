//
//  Hike.swift
//  Landmarks
//
//  Created by 長谷侑弥 on 2021/05/15.
//

import Foundation

/**
Data型にEncode, Decodeする為にCodabeCodableに適合させる
ForEach等で一覧表示する都合でHashble, Idenrifiableに適合させる
*/
 struct  Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    //A formatter that provides localized descriptions of linear distances, such as length and height measurements.
    static var formatter = LengthFormatter()

    var distanceText: String {
        return Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart:
            Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>

    }


}
