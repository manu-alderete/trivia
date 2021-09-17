//
//  CategoriesVIewModel.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 16/09/2021.
//

import Foundation

final class CategoriesViewModel {
    private let categoriesService: CategoryService
    var categories = [Category]()
    
    init(categoriesService: CategoryService) {
        self.categoriesService = categoriesService
    }
    
    func getCategories(completion: @escaping (Result<[Category], Error>)-> Void) {
        categoriesService.getCategories { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categories = categories
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
