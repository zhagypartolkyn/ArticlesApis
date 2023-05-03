//
//  HistoryViewController.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import UIKit

class HistoryViewController: UIViewController{
    
    let historyPage = HistoryPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "History"
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tableView = historyPage.tableView
        tableView.reloadData()
    }
    
    //MARK: - Tableview setup
    private func setupTableView(){
        let tableView = historyPage.tableView
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
//MARK: - Table view functions

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedCells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell
        else {
        fatalError("Unable to dequeue NewsCell in ViewController")
        }

        cell.newsTitle.text = selectedNews[indexPath.row].title
        //problem shows: unexpectedly found nil when
        cell.newsLogo.downloaded(from: URL(string: selectedNews[indexPath.item].urlToImage!)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let news = selectedNews[indexPath.row]
        let vc = NewsDetailsViewController(news)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            tableView.beginUpdates()
            selectedCells.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(selectedCells.count) articles in your history"
    }
}
    
