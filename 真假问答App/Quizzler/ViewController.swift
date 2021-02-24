import UIKit

class ViewController: UIViewController {
    let questions = [
    Question(text: "马云是中国首富", correctAnswer: true),
    Question(text: "苹果公司是很牛的科技公司", correctAnswer: true),
    Question(text: "写10000行代码能变成高手吗？", correctAnswer: true),
    Question(text:"优酷比B站🐂",correctAnswer:false),
    Question(text:"撒贝宁说过清华还行吗？",correctAnswer:false),
    Question(text:"一直坚持做IOS可以找到工作吗？",correctAnswer:true),
    Question(text:"说苹果不好安卓好的人一般的都是水军吗？",correctAnswer:true),
    Question(text:"在国内可以正常访问google吗？",correctAnswer:false),
    Question(text:"王思聪是80后",correctAnswer:true),
    Question(text:"豆瓣是一个分享你刚编的故事的网站吗？",correctAnswer:false),
    Question(text:"我是个伞兵？",correctAnswer:true),
    Question(text:"ios的主流语言是swift吗?", correctAnswer: true),
    Question(text:"今年是2021年吗？",correctAnswer: true)
        
    ]
    var questionNum = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[questionNum].questionText
        
    }


    @IBAction func answerPressed(_ sender: UIButton) {
        checkAnswer(tag: sender.tag)
        questionNum += 1
        nextQuestion()
        updateUI()
        
        
       
        
    }
    
    func updateUI() {
        progressLabel.text = "\(questionNum+1)/13"
        progressBar.frame.size.width = (view.frame.width/13)*CGFloat(questionNum+1)
    }
    

    func nextQuestion() {
        if questionNum<=12{
        questionLabel.text = questions[questionNum].questionText //控制器从model取问题，给view---MVC
        }else{
            print("到底了")
            questionNum = 0
            score = 0
            let alert =  UIAlertController(title: "漂亮", message: "你已经完成了所有问题，是否重来一遍？", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "再来一次", style: .default, handler: { (_) in
                self.questionLabel.text = self.questions[0].questionText
                self.scoreLabel.text = "总得分：0"
//                self.progressLabel.text = "1/13"
//                self.progressBar.frame.size.width = self.view.frame.width/13
                self.updateUI()
            }))
        present(alert, animated: true, completion: nil)
            
        }
                
                
          
    }
    
    
    func checkAnswer(tag:Int) {
        if tag == 1{
            if questions[questionNum].answer == true{
                print("回答正确")
                score+=1
                scoreLabel.text = "总得分：\(score)"
            }else{
                print("回答错误")
            }
        }else{
            if questions[questionNum].answer == true{
                print("回答错误")
            }else{
                print("回答正确")
                score+=1
                scoreLabel.text = "总得分：\(score)"
            }
        }
        
    }
    
    
    func startOver() {
       
    }
    

    
}
