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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

    }
    
}

extension SearchBarBookViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.BookTableViewCell, for: indexPath)
        
        return cell
    }
    
    
}
