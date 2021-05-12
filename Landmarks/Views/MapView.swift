//
//  MapView.swift
//  Landmarks
//
//  Created by Yuya Hase on 2021/05/12.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //When the state value changes, the view invalidates its appearance and recomputes the body.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            //Adds an action to perform when this view appears.
            .onAppear{
                setRegion(coordinate)
            }
    }

    private func setRegion(_ coodinate: CLLocationCoordinate2D){
        //Creates a coordinate region with a span around the specified center coordinate.
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }


}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
