//
//  CircleImage.swift
//  NationalParks
//
//  Created by Brian Halpin on 12/05/2023.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image.resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .frame(width: 150, height: 150)
    }
}

//struct CircleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage(image: Image("joshuatree"))
//    }
//}
