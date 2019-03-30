//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Christian Engelberth Olsen on 29/03/2019.
//

import Foundation

class QuestionBank{
    
    var questionList = [Question]()
    
    init(){
        
        createList()
        
    }
    
    func createList(){
        questionList.append(Question(text:"The first iPhone came out in 2007",correctAnswer: true))
        
         questionList.append(Question(text:"Steve Jobs introduced iPhone 5S",correctAnswer: false))
        
         questionList.append(Question(text:"Tim Cook became CEO of Apple in 2012",correctAnswer: false))
        
         questionList.append(Question(text:"Apple Maps was a huge succes at launch",correctAnswer: false))
        
         questionList.append(Question(text:"AirPower came out as promised in 2018",correctAnswer: false))
        
         questionList.append(Question(text:"The iPhone X came out in 2017",correctAnswer: true))
        
         questionList.append(Question(text:"Steve Jobs sold Pixar to Disney",correctAnswer: true))
        
         questionList.append(Question(text:"Bill Gates invested in Apple",correctAnswer: true))
        
         questionList.append(Question(text:"Vice-President Al Gore is a board member at Apple",correctAnswer: true))
        
         questionList.append(Question(text:"iPhone 4 was the first iPhone with 4G connectivity",correctAnswer: false))
        
         questionList.append(Question(text:"Apple bought Beats",correctAnswer: true))
        
         questionList.append(Question(text:"Apple Watch was announced in 2014",correctAnswer: true))
        
         questionList.append(Question(text:"Steve Jobs killed the Newton",correctAnswer: true))
        
         questionList.append(Question(text:"The Apple event in March 2019, was only about Services",correctAnswer: true))
    }
}
