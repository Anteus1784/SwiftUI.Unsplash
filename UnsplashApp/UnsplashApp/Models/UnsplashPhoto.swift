//
//  UnsplashPhoto.swift
//  UnsplashApp
//
//  Created by Antonio MICHEL on 1/23/24.
//

import Foundation
import SwiftUI

struct UnsplashPhoto: Codable, Identifiable{
    let id: String
    let slug: String
    let user: User
    let urls: UnsplashPhotoUrls
}

struct User: Codable {
    let name: String
    let profile_image: UnsplashProfileImage
    let links : UnsplashProfileLinks
}

struct UnsplashProfileImage: Codable {
    let small : String
}

struct UnsplashProfileLinks: Codable {
    let html : String
}

struct UnsplashPhotoUrls: Codable {
    let full: String
    let regular: String
    let small: String
}
