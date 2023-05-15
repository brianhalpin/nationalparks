//
//  ParkDetail.swift
//  NationalParks
//
//  Created by Brian Halpin on 12/05/2023.
//

import SwiftUI

struct ParkDetail: View {
    
    @ObservedObject var parkViewModel = ParkViewModel()
    var nationalPark: NationalPark
    
    var body: some View {
        ScrollView {
            MapView(coordinates: nationalPark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            let url = URL(string: nationalPark.images[0].url)
            AsyncImage(url: url) { image in
                CircleImage(image: image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(nationalPark.name), \(nationalPark.addresses[0].stateCode)")
                        .font(.title)
                    .foregroundColor(.orange)
                }
                HStack {
                    Text(nationalPark.fullName)
                    Spacer()
                    Text(nationalPark.addresses[0].city)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(nationalPark.fullName)")
                    .font(.title2)
                Spacer()
                Text(nationalPark.description)
                Spacer()
                    .frame(height: 20)
                Text("Weather Info")
                    .font(.title2)
                Spacer()
                Text(nationalPark.weatherInfo)

            }
            .padding()
        }
        .navigationTitle(nationalPark.name)
        .navigationBarTitleDisplayMode(.inline)
    }}
