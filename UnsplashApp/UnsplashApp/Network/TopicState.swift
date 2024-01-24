//
//  TopicState.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/24/24.
//

import Foundation

class TopicState :ObservableObject{
    @Published var listTopic: [UnsplashTopic]?
    @Published var topicPhoto: [UnsplashPhoto]?

    func fetchListTopic() async {
        guard let urlUnwrapped = (UnsplashAPI().topicListUrl()) else {
            print ("L'url est vide")
            return
        }
            
        print("Topic list : \(urlUnwrapped)")
        
        do {
            
            let request = URLRequest(url: urlUnwrapped)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let deserializedData = try JSONDecoder().decode([UnsplashTopic].self, from: data)

            listTopic = deserializedData

        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchTopicPhoto(name: String?) async {
        
        guard let nameUnwrapped = name else {
            print ("Le string est vide")
            return
        }
        
        guard let urlUnwrapped = (UnsplashAPI().topicPhotoUrl(name: nameUnwrapped)) else {
            print ("L'url est vide")
            return
        }
            
        print("Topic photo : \(urlUnwrapped)")
        
        do {
            
            let request = URLRequest(url: urlUnwrapped)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

            topicPhoto = deserializedData

        } catch {
            print("Error: \(error)")
        }
    }
}
