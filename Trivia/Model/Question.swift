//
//  Question.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 14/09/2021.
//

import Foundation

struct Question: Codable {
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    enum Difficulty: String, Codable {
        case easy
        case medium
        case hard
    }
    
    enum QuestionType: String, Codable {
        case boolean
        case multiple
    }
}


//"results": [
//    {
//        "category": "History",
//        "type": "boolean",
//        "difficulty": "easy",
//        "question": "The Cold War ended with Joseph Stalin&#039;s death.",
//        "correct_answer": "False",
//        "incorrect_answers": [
//            "True"
//        ]
//    },
