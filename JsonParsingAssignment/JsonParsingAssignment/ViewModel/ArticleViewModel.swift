//
//  ArticleViewModel.swift
//  JsonParsingAssignment

import UIKit

typealias ServiceCompletion = (Result<[Article], Error>) -> Void

class ArticleViewModel {
    final let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2a80fdafdcad4cfb8783a04573b14de2")
    let imageCache = NSCache<AnyObject, AnyObject>()
    var serverData = [Article]()
    
    
    //Pass Downloaded data
    func downloadJson(completion: @escaping ([Article], Error?) -> Void) {
        self.downloadJsonFromUrl { (result) in
            switch result {
            case .success(let articles):
                completion(articles, nil)
            case .failure(let error):
                completion([], error)
            }
        }
    }
    
    // Download data
    func downloadJsonFromUrl(with completion: @escaping ServiceCompletion) {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            do
            {
                let decoder = JSONDecoder()
                let downloadedData = try decoder.decode(DTOData.self, from: data)
                self.serverData = downloadedData.articles ?? []
                completion(.success(self.serverData))
            } catch {
                completion(.failure(error))
                print("something wrong after downloaded")
            }
        }.resume()
    }
}
