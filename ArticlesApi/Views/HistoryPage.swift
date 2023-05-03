//
//  HistoryPage.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation
import UIKit

class HistoryPage{
    
    let reuseIdentifier = "cell"
    
    //MARK: - UI Components

    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "You don't have history yet. Please, make a Search first"
        textLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        textLabel.numberOfLines = 0
        textLabel.textColor = .black
        textLabel.isHidden = false
        return textLabel
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        return tableView
    }()
}
