//
//  HomeCell.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 02.05.2023.
//


import Foundation
import UIKit

class HomeCell: UITableViewCell{
    
    static let identifier = "HomeCell"
    
    //MARK: - Variables
    var news: Article!
    
    //MARK: - UIComponents
    var newsType: UILabel = {
        let newsType = UILabel()
        newsType.textColor = .label
        newsType.font = .systemFont(ofSize: 30, weight: .semibold)
        return newsType
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    private func setupUI(){
        self.addSubview(newsType)
        
        newsType.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsType.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 100),
            newsType.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

