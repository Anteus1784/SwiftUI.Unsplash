//
//  UnsplashTopic.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/24/24.
//

import Foundation
import SwiftUI

struct UnsplashTopic: Codable, Identifiable{
    let id: String
    let slug: String
    let title: String
    let featured: Bool
    let links: UnsplashTopicLinks
    let cover_photo: UnsplashTopicCoverPhoto
}

struct UnsplashTopicLinks: Codable {
    let photos: String
}

struct UnsplashTopicCoverPhoto: Codable {
    let urls : UnsplashTopicCoverPhotoUrls
}

struct UnsplashTopicCoverPhotoUrls: Codable {
    let full: String
    let regular: String
    let small: String
}
