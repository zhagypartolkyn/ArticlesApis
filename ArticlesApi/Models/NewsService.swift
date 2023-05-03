//
//  NewsService.swift
//  ArticlesApi
//
//  Created by Толкын Жагыпар on 01.05.2023.
//

import Foundation

class NewsService{
    
    static func fetchNews(with url: URL, completion: @escaping ([Article]) -> Void){
        let newsData = [Article]()
        var filteredNews = [Article]()

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, responce, error in
            
            guard let data = data, error == nil else{
                print("Something went wrong")
                return
            }
            var result: News?
            do {
                result = try JSONDecoder().decode(News.self, from: data)
                completion(result?.articles ?? newsData)
            } catch {
                print("Error \(error)")
            }
            DispatchQueue.main.async {
                filteredNews = newsData
            }
        })
        
        task.resume()
    }
}
