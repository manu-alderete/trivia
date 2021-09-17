//
//  CategoriesService.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 16/09/2021.
//

import Foundation
import Alamofire

enum NetworkingError: Error {
    case decodingError
}

class CategoryService {
    private struct Categories: Codable {
        let trivia_categories: [Category]
    }
    
    let apiClient = AlamofireAPIClient()
    
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        let categoriesURL = "https://opentdb.com/api_category.php"
        apiClient.get(url: categoriesURL) { response in
            switch response {
            case .success(let data):
                do {
                    let categories = try JSONDecoder().decode(Categories.self, from: data)
                    completion(.success(categories.trivia_categories))
                } catch {
                    completion(.failure(NetworkingError.decodingError))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
