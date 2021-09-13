//
//  SearchBarBookViewController.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import UIKit

class SearchBarBookViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = "Search Book Name here..."
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectedItem: UIBarButtonItem!
    lazy var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.tableView = self.tableView
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.BookTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.BookTableViewCell)
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = false

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedItem.title = Constants.select
    }
    @IBAction func showFavoriteView(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteBookViewController") as? FavoriteBookViewController else {return}

        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func addInToFavoretedButton(_ sender: Any) {
        
        
        
    }
    @IBAction func selectedTapButton(_ sender: Any) {
        
        if selectedItem.title == Constants.select {
            selectedItem.title = Constants.Deselect
            tableView.isEditing = true

        }else if selectedItem.title == Constants.Deselect {
            selectedItem.title = Constants.select
            tableView.isEditing = false

        }
    }
    
}

extension SearchBarBookViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("hello")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.BookTableViewCell, for: indexPath) as? BookTableViewCell else{
         fatalError() }

        cell.configer(at: viewModel.dataArray[indexPath.row])
        
        //same like if condation like down if array ture then cell.accessorytype .checkmark if false it becmoe .none
        cell.accessoryType = viewModel.dataArray[indexPath.row].selection ? .checkmark : .none
        
//        if viewModel.dataArray[indexPath.row].selection == true{
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
       return true
    }
    
    func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        tableView.setEditing(true, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        
        // this is like if condtiaon like down if it is true u become false or false u become ture
        viewModel.dataArray[indexPath.row].selection = !viewModel.dataArray[indexPath.row].selection
//        if viewModel.dataArray[indexPath.row].selection == false {
//            viewModel.dataArray[indexPath.row].selection = true
//        }else {
//            viewModel.dataArray[indexPath.row].selection = false
//        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("dddddeselected")
        var doto = viewModel.dataArray[indexPath.row].selection

    }
    

    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {return}
        viewModel.searchBook(st: text)

        searchBar.resignFirstResponder()
        searchBar.text = ""
        viewModel.dataArray.removeAll()
        
    }
    
    
}
