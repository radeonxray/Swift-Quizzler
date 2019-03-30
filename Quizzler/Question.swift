//
//  Question.swift
//  Quizzler
//
//  Created by Christian Engelberth Olsen on 29/03/2019.
//

import Foundation

class Question{
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
    
}

