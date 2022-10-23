
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButtonOutlet: UIButton!
    
    @IBOutlet weak var trueButtonOutlet: UIButton!
    
    var quizBrain = QuizBrain()

    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        progressBar.progress = 0
        
        
        
        questionText.text = quizBrain.questions[quizBrain.questionNumber].q
    }
    
    func changeColor(_ sender:UIButton) {
        quizBrain.updateQuestionNumber()
        questionText.text = quizBrain.questions[quizBrain.questionNumber].q
        let answerIsCorrect = quizBrain.answerIsCorrect(userAnswer: sender.currentTitle!)
        progressBar.progress = quizBrain.changeProgressBar()
        
        answerIsCorrect ? (sender.backgroundColor = .green) : (sender.backgroundColor = .red)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            sender.backgroundColor = .clear
        }
        
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        changeColor(sender)
      
     
         
    }
    @IBAction func falseButtonClicked(_ sender: UIButton) {
        changeColor(sender)
      
    }
}

