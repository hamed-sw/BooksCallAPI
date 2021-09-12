//
//  SearchBarBookViewController.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import UIKit

class SearchBarBookViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.tableView = self.tableView
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.BookTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.BookTableViewCell)

    }
    
}

extension SearchBarBookViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.BookTableViewCell, for: indexPath) as! BookTableViewCell
//        let cc = viewModel.dataArray[indexPath.row].image
//        print("this is cccccc \(cc)")
        cell.configer(at: viewModel.dataArray[indexPath.row])
        
     
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {return}
        viewModel.searchBook(st: text)

        searchBar.resignFirstResponder()
        searchBar.text = ""
        viewModel.dataArray.removeAll()
        
            
        
    }
    
    
}
