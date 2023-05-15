//
//  ParkViewModel.swift
//  NationalParks
//
//  Created by Brian Halpin on 11/05/2023.
//

import Foundation
import CoreData

class ParkViewModel: ObservableObject {
    
    @Published var isFetching = false
    @Published var nationalParks = [NationalPark]()
    @Published var errorMessage = ""
    
    var parksURL: URL {
        var components = URLComponents()
        components.host = "developer.nps.gov"
        components.scheme = "https"
        components.path = "/api/v1/parks"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "wU13Q6dQVyxS2Ba4CMqrG91ISyZIRucIdbEgQpRx"),
            URLQueryItem(name: "limit", value: "30"),
            URLQueryItem(name: "stateCode", value: "ca")]
        return components.url!
    }
    
    init() {

    }
    
    @MainActor
    func fetchData(context: NSManagedObjectContext) async {
        var request = URLRequest(url: parksURL)
        request.httpMethod = "GET"
        
        do {
            isFetching = true
            let (data, response) = try await URLSession.shared.data(for: request)

            if let resp = response as? HTTPURLResponse, resp.statusCode >= 300 {
                self.errorMessage = "Failed to hit endpopint with bad status code."
            }

            let park = try JSONDecoder().decode(ParksData.self, from: data)
            isFetching = false
            self.nationalParks = park.data
            
            if DataController().coreDataEmpty() {
                DataController().addPark(parks: self.nationalParks, context: context)
            }
            
        } catch {
            isFetching = false
            print("Failed to reach the JSON endpoint")
        }
    }
}
