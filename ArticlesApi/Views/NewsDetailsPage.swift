//
//  NewsDetailsPage.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation
import UIKit

class NewsDetailsPage: UIView{
    
    //MARK: - UI components
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var newsLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    var newsTitle: UILabel = {
        let newsTitle = UILabel()
        newsTitle.textColor = .label
        newsTitle.font = .systemFont(ofSize: 20, weight: .bold)
        newsTitle.numberOfLines = 500
        newsTitle.textAlignment = .center
        return newsTitle
    }()
    
    var newsContent: UILabel = {
        let newsContent = UILabel()
        newsContent.textColor = .label
        newsContent.text = "Description"
        newsContent.font = .systemFont(ofSize: 20, weight: .regular)
        newsContent.numberOfLines = 0
        newsContent.textAlignment = .left
        newsContent.adjustsFontSizeToFitWidth = true
        return newsContent
    }()
    
    var newsAuthor: UILabel = {
        let newsAuthor = UILabel()
        newsAuthor.textColor = .label
        newsAuthor.font = .systemFont(ofSize: 17, weight: .semibold)
        newsAuthor.textAlignment = .left
        return newsAuthor
    }()
    
    var publishedAtData: UILabel = {
        let newsAuthor = UILabel()
        newsAuthor.textColor = .label
        newsAuthor.font = .systemFont(ofSize: 17, weight: .semibold)
        return newsAuthor
    }()
    
    lazy var verticalStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [newsTitle, newsContent, newsAuthor, publishedAtData] )
        vStack.alignment = .center
        vStack.spacing = 12
        vStack.distribution = .fill
        vStack.axis = .vertical
        return vStack
    }()
    
}


