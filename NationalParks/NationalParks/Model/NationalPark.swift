//
//  NationalPark.swift
//  NationalParks
//
//  Created by Brian Halpin on 11/05/2023.
//

import Foundation
import CoreLocation

// MARK: - Park
struct ParksData: Codable {
    let total, limit, start: String
    let data: [NationalPark]
}

// MARK: - NationalPark
struct NationalPark: Codable, Identifiable {
    let id: String
    let fullName, description: String
    let longitude, latitude: String
    let addresses: [Address]
    let images: [ParkImage]
    let weatherInfo, name: String

    var locationCoordinate: CLLocationCoordinate2D {
        let doubleLat = Double(latitude)
        let doubleLong = Double(longitude)

        return CLLocationCoordinate2D(
            latitude: doubleLat!,
            longitude: doubleLong!)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, fullName, description, latitude, longitude
        case images, weatherInfo, name, addresses
    }
}

// MARK: - Address
struct Address: Codable {
    let city: String
    let stateCode: String
}

// MARK: - Image
struct ParkImage: Codable {
    let url: String
}
