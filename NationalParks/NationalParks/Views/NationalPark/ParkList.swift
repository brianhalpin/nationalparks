//
//  ParkList.swift
//  NationalParks
//
//  Created by Brian Halpin on 12/05/2023.
//

import SwiftUI

struct ParkList: View {
    @ObservedObject var parkViewModel = ParkViewModel()
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Park.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Park.name, ascending: true)]) var parkResults: FetchedResults<Park>
    
    var body: some View {
        NavigationView {
            List {
                
                if parkResults.isEmpty {
                    ProgressView()
                    Text("Fetching data from the internet")
                        .onAppear(perform: {
                            Task.init {
                                await parkViewModel.fetchData(context:context)
                            }
                        })
                    
                    ForEach(parkViewModel.nationalParks) { nationalPark in

                        NavigationLink {
                            ParkDetail(nationalPark: nationalPark)
                        } label: {
                            ParkRow(nationalPark: nationalPark)
                        }
                    }
                    
                } else {
                    ForEach(parkResults, id:\.id) { park in
                        
                        let address = Address(city: park.city ?? "city", stateCode: park.stateCode ?? "ca")
                        let image = ParkImage(url: park.imageURL ?? "")
                        
                        let nationalPark = NationalPark(id: park.parkID!, fullName: park.fullName!, description: park.parkDescription!, longitude: String(park.longitude), latitude: String(park.latitude), addresses: [address], images: [image], weatherInfo: park.weatherInfo!, name: park.name!)
                        
                        NavigationLink {
                            ParkDetail(nationalPark: nationalPark)
                        } label: {
                            ParkRow(nationalPark: nationalPark)
                        }
                    }
                }

            }
            .navigationTitle("US National Parks")
//            .task {
//                await parkViewModel.fetchData(context: context)
//            }
            .navigationBarItems(trailing: refreshButton)
        }
    }
    
    private var refreshButton: some View {
        Button {
            parkViewModel.nationalParks.removeAll()
            Task.init {
                await parkViewModel.fetchData(context:context)
            }
            
        } label: {
            Text("Refresh")
        }
    }
}

struct ParkList_Previews: PreviewProvider {
    static var previews: some View {
        ParkList()
    }
}
