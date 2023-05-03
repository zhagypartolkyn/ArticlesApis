//
//  NewsDetailsViewController.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import UIKit


class NewsDetailsViewController: UIViewController {

    //MARK: - Variables
    let newsDetails = NewsDetailsPage()
    var news: Article
    var onImageLoaded: ((UIImage?)->Void)?
    
    //MARK: - Lifecycle
    init(_ news: Article) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupUI()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = self.news.title
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        newsDetails.newsTitle.text =  news.title
        newsDetails.newsContent.text = news.content
        newsDetails.publishedAtData.text = ("Date: \(news.publishedAt!)")
        newsDetails.newsAuthor.text = ("Author: \(news.author ?? "Unknown")")
        newsDetails.newsLogo.downloaded(from: URL(string: news.urlToImage!)!)
    }

    private func setupUI(){

        self.view.addSubview(newsDetails.scrollView)
        newsDetails.scrollView.addSubview(newsDetails.contentView)
        newsDetails.contentView.addSubview(newsDetails.newsLogo)
        newsDetails.contentView.addSubview(newsDetails.verticalStack)

        newsDetails.scrollView.translatesAutoresizingMaskIntoConstraints = false
        newsDetails.contentView.translatesAutoresizingMaskIntoConstraints = false
        newsDetails.newsLogo.translatesAutoresizingMaskIntoConstraints = false
        newsDetails.verticalStack.translatesAutoresizingMaskIntoConstraints = false

        let height = newsDetails.contentView.heightAnchor.constraint(equalTo: newsDetails.scrollView.heightAnchor)
        height.priority = UILayoutPriority(1)
        height.isActive = true

        NSLayoutConstraint.activate([

            newsDetails.scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            newsDetails.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsDetails.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsDetails.scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            newsDetails.scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            newsDetails.scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            newsDetails.contentView.leadingAnchor.constraint(equalTo: newsDetails.scrollView.leadingAnchor),
            newsDetails.contentView.topAnchor.constraint(equalTo: newsDetails.scrollView.topAnchor),
            newsDetails.contentView.trailingAnchor.constraint(equalTo: newsDetails.scrollView.trailingAnchor),
            newsDetails.contentView.bottomAnchor.constraint(equalTo: newsDetails.scrollView.bottomAnchor),

            newsDetails.newsLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsDetails.newsLogo.topAnchor.constraint(equalTo: newsDetails.contentView.topAnchor, constant: 20),
            newsDetails.newsLogo.trailingAnchor.constraint(equalTo: newsDetails.contentView.trailingAnchor),
            newsDetails.newsLogo.leadingAnchor.constraint(equalTo: newsDetails.contentView.leadingAnchor),
            newsDetails.newsLogo.heightAnchor.constraint(equalToConstant: 120),

            newsDetails.verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsDetails.verticalStack.topAnchor.constraint(equalTo: newsDetails.newsLogo.bottomAnchor, constant: 20),
            newsDetails.verticalStack.trailingAnchor.constraint(equalTo: newsDetails.contentView.trailingAnchor),
            newsDetails.verticalStack.leadingAnchor.constraint(equalTo: newsDetails.contentView.leadingAnchor),
            newsDetails.verticalStack.bottomAnchor.constraint(equalTo: newsDetails.contentView.bottomAnchor)
        ])
    }
}
