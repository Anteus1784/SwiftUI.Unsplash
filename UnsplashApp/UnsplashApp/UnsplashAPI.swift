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
    private let routePhoto: String = "photos"
    private let queryClientId = URLQueryItem(name: "client_id", value:ConfigurationManager.instance.plistDictionnary.clientId)
    
    func unsplashApiBaseUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = routePhoto
        components.queryItems = [queryClientId]
        let url = components.url
        return components
    }
    
    func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var feedUrl = unsplashApiBaseUrl()
        let queryOrderBy = URLQueryItem(name: "orderBy", value: orderBy)
        let queryPerPage = URLQueryItem(name: "perPage", value: String(perPage))
        feedUrl.queryItems = [queryOrderBy, queryPerPage]
        let url = feedUrl.url
        print(feedUrl.url)
        return url
        }
}
