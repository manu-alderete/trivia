//
//  QuestionViewModel.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 16/09/2021.
//

import Foundation

final class QuestionViewModel {
    let questionService: QuestionService
    var category: Category?
    
    var questions = [Question]()
    private(set) var isFetchingQuestions: Bool = false
    var currentQuestionIndex = 0
    
    init(questionService: QuestionService, category: Category? = nil) {
        self.questionService = questionService
        self.category = category
    }
    
    func getQuestions(completion: @escaping (Result<[Question], Error>)->Void) {
        guard !isFetchingQuestions else { return }
        isFetchingQuestions = true
        questionService.getQuestions(for: category?.id ?? nil) { [weak self] result in
            switch result {
            case .success(let questions):
                if self?.questions == nil {
                    self?.questions = questions
                } else {
                    self?.questions.append(contentsOf: questions)
                }
                completion(.success(questions))
            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
            self?.isFetchingQuestions = false
        }
    }
    
    func getCurrentQuestion() -> String {
        guard !questions.isEmpty, currentQuestionIndex < questions.count else { return "" }
        return questions[currentQuestionIndex].question
    }
}
