//
//  Landmark.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    private var imageName: String
    var image: Image{
        Image(imageName)
    }

    private var coordinates: Coordinates
    //Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}