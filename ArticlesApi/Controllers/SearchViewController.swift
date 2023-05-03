//
//  SearchViewController.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import UIKit

//MARK: - Global variables

var selectedCells: [UITableViewCell] = []
var selectedNews: [Article] = []
var newsData = [Article]()

class SearchViewController: UIViewController, UISearchBarDelegate {

    //MARK: - Variables
    var filteredNews = newsData
    let searchPage = SearchPage()
    private let searchController = UISearchController(searchResultsController: nil)
    private var isSearching: Bool = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9357153773, green: 0.8519434333, blue: 0.8319105506, alpha: 1)
        setupTableView()
        setupSearchController()
    }
    
    //MARK: - Tableview setup
    private func setupTableView(){
        
        let tableView = searchPage.tableView
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - Search Controller Setup
    private func setupSearchController(){
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Discover world news"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.definesPresentationContext = false
    }
    
    //MARK: - Get data for each type of news
    func openBusinessNews(){
        self.title = "Business"
        NewsService.fetchNews(with: URL(string: URLExamples.business.rawValue)!) { data in
           newsData = data
           self.filteredNews = newsData
           let tableView = self.searchPage.tableView
           DispatchQueue.main.async {
               tableView.reloadData()
           }
        }
     }

    func openTechCrunchNews(){
        self.title = "Tech Crunch"
        NewsService.fetchNews(with: URL(string: URLExamples.techcrunch.rawValue)!) { data in
           newsData = data
           self.filteredNews = newsData
           let tableView = self.searchPage.tableView
           DispatchQueue.main.async {
               tableView.reloadData()
           }
        }
     }

    func openAppleNews(){
        self.title = "Apple"
        NewsService.fetchNews(with: URL(string: URLExamples.apple.rawValue)!) { data in
           newsData = data
           self.filteredNews = newsData
           let tableView = self.searchPage.tableView
           DispatchQueue.main.async {
               tableView.reloadData()
           }
        }
     }
       
    func openWallstreetNews(){
        self.title = "Wall Street"
        NewsService.fetchNews(with: URL(string: URLExamples.wallStreet.rawValue)!) { data in
           newsData = data
           self.filteredNews = newsData
           let tableView = self.searchPage.tableView
           DispatchQueue.main.async {
               tableView.reloadData()
           }
        }
     }
}

//MARK: - Search bar functions

extension SearchViewController{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        let tableView = searchPage.tableView
        self.filteredNews = newsData
        for article in newsData{
            if article.title?.lowercased().contains(searchBar.text?.lowercased() ?? "No title") != nil {
                self.filteredNews = []
                self.filteredNews.append(article)
                }
   //         }
            tableView.reloadData()
        }
    }
}
        
//MARK: - Table view functions
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredNews.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
        fatalError("Unable to dequeue NewsCell in ViewController") }
        
        cell.newsTitle.text = self.filteredNews[indexPath.row].title
//        problem shows: unexpectedly found nil when it takes time to download img
        cell.newsLogo.downloaded(from: URL(string: self.filteredNews[indexPath.item].urlToImage!)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath)
        let news = filteredNews[indexPath.row]
        let vc = NewsDetailsViewController(news)
        
        self.navigationController?.pushViewController(vc, animated: true)
        selectedCells.append(cell!)
        selectedNews.append(news)
    }
}

//MARK: - Get image from api for all images
extension UIImageView {

    func downloaded(from url: URL) {
        contentMode = .scaleToFill
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()

   }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}
