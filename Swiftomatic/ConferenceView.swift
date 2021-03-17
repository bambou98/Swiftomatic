//
//  ConferenceView.swift
//  Swiftomatic
//
//  Created by Catherine Gregeois on 16/03/2021.
//

import SwiftUI

struct ConferenceView: View {
    var conferences: [Conference]
    var body: some View {
        NavigationView {
            List {
                ForEach(conferences) { conference in ConferenceRow(conference: conference)
                }
                HStack {
                    Spacer()
                    Text("\(conferences.count) Conférences")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Conférences")
        }
    }
}

struct ConferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceView(conferences: Conference.data)
    }
}

struct ConferenceRow: View {
    var conference: Conference
    var body: some View {
        NavigationLink(destination: ConferenceDetail(conference: conference)) {
            HStack {
                Image(conference.image)
                    .resizable()
                    .frame(maxWidth: 60, maxHeight: 60)
                    .scaledToFit()
                    .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.15)))
                
                VStack(alignment: .leading) {
                    Text(conference.titel)
                        .font(.headline)
                    Text(conference.date)
                        .font(.headline)
                    Text("\(conference.country)")
                        .font(.subheadline)
                }
                Spacer()
                if conference.isPresent {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct isPresentButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}
