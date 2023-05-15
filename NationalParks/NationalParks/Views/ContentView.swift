//
//  ContentView.swift
//  NationalParks
//
//  Created by Brian Halpin on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ParkViewModel()
    
    var body: some View {
        ParkList()        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
