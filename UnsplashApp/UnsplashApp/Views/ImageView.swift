//
//  ImageView.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/24/24.
//

import Foundation
import SwiftUI

struct ImageView: View {
    
    var photo : UnsplashPhoto
    
    var body: some View {
        VStack {
            Text("Une image de @\(photo.user.name)").bold().font(.title2)
            AsyncImage(url: URL(string: photo.urls.regular)) { image in
                image.image?.resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}

#Preview {
    ImageView(photo: UnsplashPhoto(id: "_hjZ74lQOls", slug: "a-person-swimming-in-the-water-near-a-cave-_hjZ74lQOls", user: User(name: "NEOM"), urls: UnsplashPhotoUrls(full: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=85", regular: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=80&w=1080", small: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=80&w=400")))
}
