//
//  FeedState.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation

class FeedState :ObservableObject{
    @Published var homeFeed: [UnsplashPhoto]?

    func fetchHomeFeed() async {
        guard  let urlUnwrapped = (UnsplashAPI().feedUrl(orderBy: "popular", perPage: 20)) else {
            print ("l'url est vide")
            return
        }
            
        
        print(urlUnwrapped)
        
        do {
            
            let request = URLRequest(url: urlUnwrapped)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

            homeFeed = deserializedData

        } catch {
            print("Error: \(error)")
        }
    }
}
