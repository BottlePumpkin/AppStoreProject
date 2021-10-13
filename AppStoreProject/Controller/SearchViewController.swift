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
    
    private let searchViewModel: SearchViewModel
    
    
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
        searchViewModel.viewDidLoad()
        
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
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = selfView.searchViewController
        navigationItem.title = "검색"
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func bind() {
        searchViewModel.results.asObservable().subscribe(onNext: {
            result in
            print("result : \(result)")
        }).disposed(by: disposeBag)
        
        
        
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
        selfView.tableView.isHidden = true
        selfView.collectionView.isHidden = false
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("dismiss")
        selfView.tableView.isHidden = false
        selfView.collectionView.isHidden = true
    }
    
    
}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.textLabel?.text = "카카오 뱅크"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "최근 검색어"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
}


extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as! SearchResultCollectionViewCell
        
        return cell
    }
    
    
    
    
}
