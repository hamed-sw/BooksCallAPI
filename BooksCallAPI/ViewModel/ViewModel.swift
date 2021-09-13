//
//  ViewModel.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import UIKit

class ViewModel {
    
    
    var dataArray = [ViewCellModel]()
    var tableView = UITableView()
    func searchBook(st: String) {
        APICalling.bookSerachingAPI(string: st) { [weak self] result in
            switch result {
            case .success(let newData):
                self?.dataArray = newData.compactMap({ ViewCellModel(name: $0.volumeInfo?.title ?? "", publisher: $0.volumeInfo?.publisher ?? "", image: $0.volumeInfo?.imageLinks?.thumbnail ?? "", selection: false )
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
}
