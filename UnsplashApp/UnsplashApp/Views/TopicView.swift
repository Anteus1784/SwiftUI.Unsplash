//
//  TopicView.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/24/24.
//

import Foundation
import SwiftUI

struct TopicView: View {
    
    let topic : UnsplashTopic
    
    @StateObject var topicState = TopicState()
    
    var body: some View {
        VStack {
            NavigationStack {
                Button(action: {
                    Task {
                        await topicState.fetchTopicPhoto(name: topic.slug)
                    }
                }, label: {
                    Text("Load Data")
                })
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 150)),
                                        GridItem(.flexible(minimum: 150))], spacing: 8){
                        if let topicPhotoUnwrapped = topicState.topicPhoto
                        {
                            ForEach(topicPhotoUnwrapped){ item in
                                AsyncImage(url: URL(string: String(item.urls.regular))) {image in image.resizable().centerCropped().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(height: 150)
                                } placeholder: {
                                    ProgressView().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(height: 150)
                                }
                            }
                        } else {
                            ForEach (1...12, id: \.self){ i in
                                Rectangle()
                                    .fill(Color.secondary)
                                    .clipShape(
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                    )
                                    .foregroundColor(.gray)
                                    .frame(height: 150)
                            }
                        }
                    }.redacted(reason: topicState.topicPhoto == nil ? .placeholder : [])
                }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .padding(.horizontal).navigationBarTitle(topic.title)
            }
        }
    }
}


#Preview {
    TopicView(topic: UnsplashTopic(id: "wJLO3tSK5AM", slug: "minimalism", title: "Minimalism", featured: true, links: UnsplashTopicLinks(photos: "https://api.unsplash.com/topics/minimalism/photos"), cover_photo: UnsplashTopicCoverPhoto(urls: UnsplashTopicCoverPhotoUrls(full: "https://images.unsplash.com/photo-1623682342657-d7e90a4fa7a9?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb", regular: "https://images.unsplash.com/photo-1623682342657-d7e90a4fa7a9?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max", small: "https://images.unsplash.com/photo-1623682342657-d7e90a4fa7a9?ixlib=rb-4.0.3&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max")))
    )
}

