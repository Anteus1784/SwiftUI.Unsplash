//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation
import SwiftUI

struct UnsplashAPI{
    
    private let scheme: String = "https"
    private let host: String = "api.unsplash.com"
    private let routePhoto: String = "/photos"
    private let queryClientId = URLQueryItem(name: "client_id", value:ConfigurationManager.instance.plistDictionnary.clientId)
    
    func unsplashApiBaseUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.queryItems = [queryClientId]
        return components
    }
    
    func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var feedUrl = unsplashApiBaseUrl()
        feedUrl.path = routePhoto
        var queryItems: [URLQueryItem] = feedUrl.queryItems ?? []
        let queryOrderBy = URLQueryItem(name: "order_by", value: orderBy)
        queryItems.append(queryOrderBy)
        let queryPerPage = URLQueryItem(name: "per_page", value: String(perPage))
        queryItems.append(queryPerPage)
        feedUrl.queryItems = queryItems
        return feedUrl.url
        }
    
    func topicListUrl() -> URL? {
        var topicListUrl = unsplashApiBaseUrl()
        let routeListTopic = "/topics"
        topicListUrl.path = routeListTopic
        return topicListUrl.url
    }
    
    func topicPhotoUrl(name:String) -> URL?{
        var topicPhotoUrl = unsplashApiBaseUrl()
        var queryItems: [URLQueryItem] = topicPhotoUrl.queryItems ?? []
        let queryPerPage = URLQueryItem(name: "per_page", value: String(20))
        queryItems.append(queryPerPage)
        topicPhotoUrl.queryItems = queryItems
        let routePhotoTopic = "/topics/\(name)/photos"
        topicPhotoUrl.path = routePhotoTopic
        return topicPhotoUrl.url
    }
}
