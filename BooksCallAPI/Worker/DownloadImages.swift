//
//  DownloadImages.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import Foundation


class DownloadImage {
    
    static func imageDowloag(string: String, complition: @escaping (Data)->()) {
        guard let url = URL(string: string) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
                complition(data)
            
        }.resume()
        
    }
}
