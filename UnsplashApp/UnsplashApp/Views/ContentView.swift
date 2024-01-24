//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var feedState = FeedState()
    @StateObject var topicState = TopicState()
    
    @State var selectedPhoto: UnsplashPhoto?
    
    var body: some View {
        VStack {
            NavigationStack {
                Button(action: {
                    Task {
                        await feedState.fetchHomeFeed()
                        await topicState.fetchListTopic()
                    }
                }, label: {
                    Text("Load Image")
                })
                ScrollView(.horizontal){
                    LazyHGrid(rows: [GridItem(.flexible(minimum: 90, maximum: 100))], spacing: 8){
                        if let listTopicUnwrapped = topicState.listTopic
                        {
                            ForEach(listTopicUnwrapped){ item in
                                if item.featured {
                                    NavigationLink{TopicView(topic: item)} label: {
                                        VStack {
                                            AsyncImage(url: URL(string: String(item.cover_photo.urls.regular))) {image in image.resizable().centerCropped().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(width:90, height: 50)
                                            } placeholder: {
                                                ProgressView().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(width:90, height: 50)
                                            }
                                            
                                            Text(item.title).frame(width: 90)
                                        }
                                    }
                                }
                            }
                        } else {
                            ForEach (1...12, id: \.self){ i in
                                VStack {
                                    Rectangle()
                                        .fill(Color.secondary)
                                        .clipShape(
                                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                        )
                                        .foregroundColor(.gray)
                                        .frame(width:90, height: 50)
                                    
                                    Text("          ").frame(width: 90)
                                }
                            }
                        }
                    }
                    .redacted(reason: feedState.homeFeed == nil ? .placeholder : []).padding().frame(height: 100)
                    
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 150)),
                                        GridItem(.flexible(minimum: 150))], spacing: 8){
                        if let homeFeedUnwrapped = feedState.homeFeed
                        {
                            ForEach(homeFeedUnwrapped){ item in
                                Button {
                                    selectedPhoto = item
                                } label: {
                                    AsyncImage(url: URL(string: String(item.urls.regular))) { image in image.resizable().centerCropped().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(height: 150)
                                    } placeholder: {
                                        ProgressView().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))).frame(height: 150)
                                    }
                                }
                            }.sheet(item: $selectedPhoto) { item in
                                ImageView(photo: item)
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
                    }.redacted(reason: feedState.homeFeed == nil ? .placeholder : [])
                }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .padding(.horizontal).navigationBarTitle("Feed")
            }
        }
    }
}

#Preview {
    ContentView()
}
