//
//  Model.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import Foundation

struct BookModel: Codable {
    let items: [Item]
}

struct Item: Codable {
    let volumeInfo: VolumeInfo?
}
struct VolumeInfo: Codable {
    let title:String
    let publisher: String
    let imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    let thumbnail: String
}
