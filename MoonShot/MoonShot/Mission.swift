//
//  Mission.swift
//  MoonShot
//
//  Created by Ilyes Chouia on 12/1/2022.
//

import Foundation

struct Crew: Codable {
    let name: String
    let role: String
}


struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var formattedLanuchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var image: String {
        "apollo\(id)"
    }

}
