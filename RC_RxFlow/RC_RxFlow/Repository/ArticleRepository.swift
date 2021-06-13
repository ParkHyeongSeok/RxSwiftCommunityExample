//
//  ArticleRepository.swift
//  RC_RxFlow
//
//  Created by 박형석 on 2021/06/12.
//

import Foundation

class ArticleRepository {
    
    func fetch(completion: @escaping ([ArticleEntity])->Void) {
        
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2021-06-11&to=2021-06-11&sortBy=popularity&apiKey=5fe118e16386495992db259b637abf8e"
        
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
            
            guard let data = data else { return }
            
            do {
                let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(articleResponse.articles)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
            
    }
    
}
