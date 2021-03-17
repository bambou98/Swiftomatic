//
//  ConferenceDetail.swift
//  Swiftomatic
//
//  Created by Catherine Gregeois on 16/03/2021.
//

import SwiftUI
import MapKit

struct ConferenceDetail: View {
    var conference: Conference
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: conference.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 270)
                Image(conference.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Ellipse())
                    .overlay(Ellipse().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .offset(y: -140)
                    .padding(.bottom, -140.0)
                HStack {
                    Text(conference.titel)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                }
                Text("\(conference.date)")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("\(conference.city), \(conference.country)")
                    .font(.headline)
                    .fontWeight(.light)
                Divider()
                Text(conference.description)
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

struct ConferenceDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConferenceDetail(conference: Conference.data[1])
        }
    }
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    //méthode qui met à jour la région selon les coordonnées
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}
