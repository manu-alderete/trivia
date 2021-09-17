//
//  Game.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 14/09/2021.
//

import Foundation

class Game {
    let questions: [Question]
    let currentIndex: Int = 0
    
    init(questions: [Question]) {
        self.questions = questions
    }
}
