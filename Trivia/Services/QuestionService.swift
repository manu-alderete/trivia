//
//  QuestionService.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 16/09/2021.
//

import Foundation

final class QuestionService {
    let apiClient = AlamofireAPIClient()
    
    private struct Questions: Codable {
        let response_code: Int
        let results: [Question]
    }
    
    func getQuestions(for categoryId: Int? = nil, completion: @escaping (Result<[Question], Error>) ->Void) {
        let questionsURL = "https://opentdb.com/api.php?amount=10&type=boolean"
            //"https://opentdb.com/api.php?" + (categoryId != nil ? "category=\(categoryId!)&" : "") + "type=boolean"
        apiClient.get(url: questionsURL) { response in
            switch response {
            case .success(let data):
                do {
                    let questions = try JSONDecoder().decode(Questions.self, from: data)
                    completion(.success(questions.results))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
