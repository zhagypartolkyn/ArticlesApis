//
//  SearchPage.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation
import UIKit

class SearchPage {

    let reuseIdentifier = "cell"
    let activityIndicator = UIActivityIndicatorView()
    
    //MARK: - UI Components
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        return tableView
    }()

}
