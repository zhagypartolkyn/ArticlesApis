//
//  File.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 02.05.2023.
//

import Foundation

import UIKit

class HomePage {
    
    let reuseIdentifier = "cell"
    
    //MARK: - UI Components
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
        return tableView
    }()
}
