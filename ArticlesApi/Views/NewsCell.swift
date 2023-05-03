//
//  NewsCell.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell{
    
    static let identifier = "NewsCell"
    
    //MARK: - Variables
    var news: Article!
    
    //MARK: - UIComponents
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
     var newsLogo: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .black
        iv.backgroundColor = .systemBlue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
     var newsTitle: UILabel = {
        let newsTitle = UILabel()
        newsTitle.textColor = .black
        newsTitle.numberOfLines = 0
        newsTitle.textAlignment = .left
        newsTitle.font = .systemFont(ofSize: 17, weight: .regular)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        return newsTitle
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
        
        self.contentView.addSubview(newsLogo)
        containerView.addSubview(newsTitle)
        self.contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([

            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.newsLogo.trailingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant:40),
            
            newsLogo.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            newsLogo.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            newsLogo.widthAnchor.constraint(equalToConstant: 70),
            newsLogo.heightAnchor.constraint(equalToConstant: 70),

            newsTitle.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            newsTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            newsTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
            
            
        ])
    }
}

