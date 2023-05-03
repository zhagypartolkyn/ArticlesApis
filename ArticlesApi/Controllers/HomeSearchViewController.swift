//
//  HomeSearchViewController.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 02.05.2023.
//

import UIKit

enum URLExamples: String {
    case business = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b430860f828648a7861edb05432d30dc"
    case techcrunch = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b430860f828648a7861edb05432d30dc"
    case apple = "https://newsapi.org/v2/everything?q=apple&from=2023-04-25&to=2023-04-25&sortBy=popularity&apiKey=b430860f828648a7861edb05432d30dc"
    case wallStreet = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b430860f828648a7861edb05432d30dc"
}

enum UserActions: String, CaseIterable {
    case first = "Business"
    case second = "TechCrunch"
    case third = "Apple"
    case fourth = "Wall Street"
}

class HomeSearchViewController: UIViewController {
    
    let userActions = UserActions.allCases
    var newsData = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Home"

    }
    
    private func setupTableView(){
        let tableView = HomePage().tableView
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
}

extension HomeSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userActions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath)
                as? HomeCell else {
            fatalError("Unable to dequeue HomeCell in ViewController")
        }
        
        cell.textLabel?.text = userActions[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchViewController()
        let userAction = userActions[indexPath.item]
        
        switch userAction{
        case .first:
            self.navigationController?.pushViewController(vc, animated: true)
            vc.openBusinessNews()
        case .second:
            self.navigationController?.pushViewController(vc, animated: true)
            vc.openTechCrunchNews()
        case .third:
            self.navigationController?.pushViewController(vc, animated: true)
            vc.openAppleNews()
        case .fourth:
            self.navigationController?.pushViewController(vc, animated: true)
            vc.openWallstreetNews()
        }
    }
    
}
