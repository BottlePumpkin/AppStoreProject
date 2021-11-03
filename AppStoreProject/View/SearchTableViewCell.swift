//
//  SearchViewCell.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/06.
//

import UIKit

class SearchTableViewCell: BaseTableViewCell {

     let searchIconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
    }
     let searchResultLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(searchIconImageView)
        searchIconImageView.snp.makeConstraints {
            $0.top.equalTo(self).offset(20)
        }
        
        addSubview(searchResultLabel)
        searchResultLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(20)
            $0.left.equalTo(searchIconImageView.snp.right).offset(10)
        }
        

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
