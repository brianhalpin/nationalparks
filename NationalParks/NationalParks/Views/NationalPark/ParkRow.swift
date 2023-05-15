//
//  ParkRow.swift
//  NationalParks
//
//  Created by Brian Halpin on 11/05/2023.
//

import SwiftUI

struct ParkRow: View {

    var nationalPark: NationalPark

    var body: some View {

        HStack {
            let url = URL(string: nationalPark.images[0].url)
            AsyncImage(url: url) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }
            Text(nationalPark.name)
        }

    }
}

struct ParkRow_Previews: PreviewProvider {

    static var parks = ParkViewModel().nationalParks
    static var previews: some View {
        ParkRow(nationalPark: parks[0])
    }
}
