//
//  ConferenceModel.swift
//  Swiftomatic
//
//  Created by Catherine Gregeois on 16/03/2021.
//

import Foundation
import CoreLocation

struct Conference: Identifiable {
    let id = UUID()
    var image: String
    var titel: String
    var city: String
    var country: String
    var date: String
    var description: String
    var isPresent: Bool
    
   private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
    
}

extension Conference {
    static var data: [Conference] {
        [
            Conference(image: "dotSwift", titel: "dotSwift venue", city: "Paris", country: "France", date: "February 3rd-5th 2020", description: "It's a delight to discover new language features that enhance your Swift programming experience. Many of Swift's features adopt a style that reads as if they're native constructs but are actually created and maintained by third parties. Erica shows you Swift 5's new property wrappers (added in Swift 5.2), how they fit into this paradigm and why they're an exciting avenue for developers looking to create reusable property enhancements.", isPresent: false, coordinates: Coordinates(latitude: 48.8786247, longitude: 2.33155)),
            Conference(image: "iOSConf", titel: "iOS Conf SG", city: "Singapore", country: "Singapore", date: "January 15th-18th 2020", description: "This event always starts our year off with a bang, and is the largest iOS conference in south-east Asia. This year it now runs across two workshop days plus two days of sessions, and the speaker line-up already includes Dave Verwer, Ellen Shapiro, Meng To, and more. Last year I was really impressed by the huge range of attendees – many were from Singapore and Malaysia, of course, but also from Indonesia, Japan, Australia, and beyond; it's a massive mix.", isPresent: true, coordinates: Coordinates(latitude: 1.29354989528656, longitude: 103.77143096923828)),
            Conference(image: "MobOS", titel: "MobOS", city: "Cluj Napoca", country: "Romania", date: "February 20th-21st 2020", description: "Returning for the seventh year in a row, MobOS is the largest and most important iOS conference in Romania. This is a mixed-platform event, meaning that there are iOS and Android tracks running in parallel, and last year this gave a truly memorable moment as the announcers had to ask the iOS and Android attendees to switch rooms because the iOS group was too big to fit!", isPresent: false, coordinates: Coordinates(latitude: 46.7521141, longitude: 23.5767123)),
            Conference(image: "Appdevcon", titel: "Appdevcon", city: "Amsterdam", country: "The Netherlands", date: "March 10th-13th 2021", description: "Appdevcon is the largest mobile event in the Netherlands, and as it's at the center of Europe it attracts folks from across the EU and beyond. Last year they moved to a new venue, but the concept is the same: huge cinema screens for presenters, and comfortable seats for the audience. The talks here are usually both technical and practical, but there's also a parallel design track if you want something a little different.", isPresent: false, coordinates: Coordinates(latitude: 52.3664519, longitude: 4.8934706)),
            Conference(image: "try!", titel: "try! Swift", city: "Tokyo", country: "Japan", date: "March 18th-20th", description: "Believe it or not, try! Swift Tokyo might be the largest independent iOS event in the world – their attendee numbers have skyrocketed in recent years, which is no surprise when you look at the consistently high-quality speaker line up, the extraordinary attention to organizational detail, and their long-standing commitment to building a warm and welcoming atmosphere for everyone. Highly recommended, and not just because it’s one of the coolest cities in the world!", isPresent: false, coordinates: Coordinates(latitude: 35.6580675, longitude: 139.7088474))
            
        ]
    }
}

