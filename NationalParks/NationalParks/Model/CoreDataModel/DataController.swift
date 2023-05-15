//
//  DataController.swift
//  NationalParks
//
//  Created by Brian Halpin on 14/05/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ParkModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved.")
        } catch {
            print("Could not save the data. Could be storage space on the device.")
        }
    }
    
    func coreDataEmpty() -> Bool {
        // Create a fetch request for a specific Entity type
        let fetchRequest: NSFetchRequest<Park>
        fetchRequest = Park.fetchRequest()

        // Get a reference to a NSManagedObjectContext
        let context = container.viewContext
        
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.count > 0 ? false : true
            
        } catch {
            print("There has been an error trying to fetch the entities from Core Data.")
        }
        
        return true
    }
    
    func addPark(parks: [NationalPark], context: NSManagedObjectContext) {
        
        parks.forEach { (park) in
            let parkEntity = Park(context: context)
            parkEntity.id = UUID()
            parkEntity.name = park.name
            parkEntity.fullName = park.fullName
            parkEntity.parkDescription = park.description
            parkEntity.stateCode = park.addresses[0].stateCode
            parkEntity.city = park.addresses[0].city
            parkEntity.weatherInfo = park.weatherInfo
            parkEntity.imageURL = park.images[0].url
            parkEntity.parkID = park.id
            parkEntity.longitude = park.locationCoordinate.longitude
            parkEntity.latitude = park.locationCoordinate.latitude
        }
        
        save(context: context)
    }
}
