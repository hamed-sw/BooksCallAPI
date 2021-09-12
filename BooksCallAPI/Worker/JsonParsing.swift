//
//  JsonParsing.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import Foundation

class APICalling {
    
    
    typealias success = (Result<[Item],Error>) -> Void
    
    static func bookSerachingAPI(string: String, complition: @escaping success ){
        
        guard let url = URL(string: Constants.urlBook + string) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(.failure(error))
            } else if let data = data {
                do {
                    let json = try JSONDecoder().decode(BookModel.self, from: data)
                    complition(.success(json.items!))
                }
                catch{
                    complition(.failure(error))
                    
                }
            }
            
        }.resume()
        
    }
}
