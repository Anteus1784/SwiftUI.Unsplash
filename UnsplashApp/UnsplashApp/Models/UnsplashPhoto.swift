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
}

struct UnsplashPhotoUrls: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
