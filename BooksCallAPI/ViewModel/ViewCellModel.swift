//
//  ViewCellModel.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import UIKit

class ViewCellModel {
    let name: String
    let publisher: String
    let image: String
    
    init(name:String, publisher: String, image: String) {
        self.name = name
        self.publisher = publisher
        self.image = image
    }
}
