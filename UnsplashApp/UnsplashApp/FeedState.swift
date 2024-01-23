//
//  FeedState.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation

class FeedState :ObservableObject{
    @Published var homeFeed: [UnsplashPhoto]?

    // Fetch home feed doit utiliser la fonction feedUrl de UnsplashAPI
    // Puis assigner le résultat de l'appel réseau à la variable homeFeed
    func fetchHomeFeed() async {
        let url = (UnsplashAPI().feedUrl(orderBy: "popular", perPage: 20) ?? UnsplashAPI().unsplashApiBaseUrl().url)
        
        print(url!)
        
        do {
            
            let request = URLRequest(url: url!)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

            homeFeed = deserializedData

        } catch {
            print("Error: \(error)")
        }
    }
}
