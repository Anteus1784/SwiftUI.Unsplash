//
//  ImageView.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/24/24.
//

import Foundation
import SwiftUI

enum ImageSize : String, CaseIterable, Identifiable {
    case full, regular, small
    var id: Self {self}
}

struct ImageView: View {
    
    @State private var selectedSize : ImageSize = ImageSize.regular
    
    var photo : UnsplashPhoto
    
    private var imageDownload : ImageRenderer
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Text("Une image de").bold().font(.title2)
                    AsyncImage(url: URL(string: photo.user.profile_image.small)) { image in
                        image.resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    } placeholder: {
                        ProgressView()
                    }.frame(height: 30)
                    Link("@\(photo.user.name)", destination : URL(string: photo.user.links.html)!)
                }.padding()
                
                Picker("ImageSize", selection: $selectedSize){
                    Text("full").tag(ImageSize.full)
                    Text("regular").tag(ImageSize.regular)
                    Text("small").tag(ImageSize.small)
                }.pickerStyle(.segmented)
            }
            Spacer()
            
            switch selectedSize {
            case .full:
                AsyncImage(url: URL(string: photo.urls.full)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    ProgressView()
                }
            case .regular:
                AsyncImage(url: URL(string: photo.urls.regular)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            case .small:
                AsyncImage(url: URL(string: photo.urls.small)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ImageView(photo:
                UnsplashPhoto(id: "_hjZ74lQOls",
                              slug: "a-person-swimming-in-the-water-near-a-cave-_hjZ74lQOls",
                              user: User(name: "NEOM", profile_image: UnsplashProfileImage(small: "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32"), links: UnsplashProfileLinks(html: "https://api.unsplash.com/users/neom")),
                              urls: UnsplashPhotoUrls(full: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=85", regular: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=80&w=1080", small: "https://images.unsplash.com/photo-1682687980115-a37b56ea7271?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NTc1NzF8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNjEwMTI2NHw&ixlib=rb-4.0.3&q=80&w=400")))
}
