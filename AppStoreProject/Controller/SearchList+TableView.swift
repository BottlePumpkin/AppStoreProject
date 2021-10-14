//
//  SearchList+TableView.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/13.
//

import UIKit

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.currentSearchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.searchResultLabel.text = searchViewModel.currentSearchResult[indexPath.row].trackName
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "최근 검색어"
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//        return 100
//    }
//
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        guard let header = view as? UITableViewHeaderFooterView else { return }
//        header.textLabel?.textColor = UIColor.black
//        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 28)
//        header.textLabel?.frame = header.bounds
//        header.textLabel?.textAlignment = .left
//    }
}
