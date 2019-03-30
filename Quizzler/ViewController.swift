//
//  ViewController.swift
//  Quizzler
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var question: Question?
    var currentQuestionNumber: Int = 0
    var playerScore: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFirstQuestion()
        
    }
    
    //Set the first question at the beginning of the Quiz
    func setFirstQuestion(){
        question = allQuestions.questionList[currentQuestionNumber]
        questionLabel.text = question?.questionText
        updateUI()
    }


    //Function that checks which button was pressed
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        //Checking tag 1, which is the "True"-button
        if sender.tag == 1 {
            pickedAnswer = true
        }
            
        //Checking tag 2, which is the "False"-button
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        //Check the answer
        checkAnswer()
    }
    
    //Function for updating/refreshing the UI, score, question status etc.
    func updateUI() {
        
        progressLabel.text = "\(currentQuestionNumber+1)/\(allQuestions.questionList.count)"
        scoreLabel.text = "Score: \(playerScore)"
        
        //Increase the width of the frame, to show the progressbar
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.questionList.count)) * CGFloat(currentQuestionNumber+1)
        
        
        //Dirty hack to avoid displaying a number for the current question to become larger than the actual amount of question
        if currentQuestionNumber >= allQuestions.questionList.count{
            progressLabel.text = "\(currentQuestionNumber)/\(allQuestions.questionList.count)"

        }
      
    }
    

    //Get the next Question
    func nextQuestion() {
        
        currentQuestionNumber += 1
        updateUI()
        
        //If the number of the current question is less than the actual amount of questions
        // then retrieve and show the next question
        if currentQuestionNumber < allQuestions.questionList.count{
            question = allQuestions.questionList[currentQuestionNumber]
            questionLabel.text = question?.questionText
            
        }
            
        //If there are no more question, show the endGameAlert
        else {
            
            endGameAlert()

        }
    }
    
    //Alert for when the game has ended and there are no more questions
    func endGameAlert(){
        
        //Create the Base Alert
        let alert = UIAlertController(title: "Quiz done! Final score: \(playerScore)!", message: "Do you want to start over?", preferredStyle: .alert)
        
        //Create option to the Alert function
        let restartAction = UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler:
        { (UIAlertAction) in self.startOver()})
        
        // Add the RestartAction to the base Alert
        alert.addAction(restartAction)
        
        //Show the Alert
        present(alert, animated: true, completion: nil)
        
    }
    
    //Check if the answer is correct
    func checkAnswer() {
        
        //If the answer is correct
        if question?.answer == pickedAnswer{
            ProgressHUD.showSuccess("Correct!")
            playerScore += 100
        }
        
        //if the answer is incorrect
        else {
            ProgressHUD.showError("Wrong!")
            playerScore -= 25
        }
        
        //Go to the next question afterwards
        nextQuestion()
        
    }
    
    //Function for restarting the game and ressetting the stats and questions
    func startOver() {
        currentQuestionNumber = -1
        playerScore = 0
        updateUI()
        nextQuestion()
    }
    

    
}
