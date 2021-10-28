//
//  SearchViewController.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/04.
//

import UIKit
import SnapKit
import RxSwift

final class SearchViewController: BaseViewController {
    
    private let selfView = SearchView()
    
    let searchViewModel: SearchViewModel
    
    
    init(searchViewModel : SearchViewModel) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        view.addSubview(selfView)
        selfView.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.left.equalTo(self.view)
            $0.right.equalTo(self.view)
            $0.bottom.equalTo(self.view)
        }
        
        selfView.searchViewController.delegate = self
        selfView.searchViewController.searchResultsUpdater = self
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = selfView.searchViewController
        navigationItem.title = "검색"
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func bind() {
        
        searchViewModel.searchAppstoreSearch(searchKeyword: "카카오") {
            DispatchQueue.main.async {
                self.selfView.tableView.reloadData()
            }
            
        }
        
    
        
    }
    
    
}

extension SearchViewController: UISearchControllerDelegate {
    
    
    
}


extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("update")

    }
    
    func presentSearchController(_ searchController: UISearchController) {
        print("present")
//        selfView.tableView.isHidden = true
//        selfView.collectionView.isHidden = false
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("dismiss")
    }
    
    
}




