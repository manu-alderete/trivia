//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 14/09/2021.
//

import UIKit

final class QuestionViewController: BaseViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var viewModel: QuestionViewModel!
    
    init(category: Category? = nil) {
        viewModel = QuestionViewModel(questionService: QuestionService(), category: category)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trueButton.imageView?.contentMode = .scaleAspectFit
        falseButton.imageView?.contentMode = .scaleAspectFit
        
        trueButton.addTarget(self, action: #selector(trueButtonHandler), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(falseButtonHandler), for: .touchUpInside)
        
        self.title = viewModel.category?.name ?? "Random"
        
        trueButton.isUserInteractionEnabled = false
        falseButton.isUserInteractionEnabled = false
        
        getQuestions()
    }
    
    private func getQuestions() {
        viewModel.getQuestions { [weak self] result in
            switch result {
            case .success(_):
                self?.questionLabel.text = self?.viewModel.getCurrentQuestion()
                self?.trueButton.isUserInteractionEnabled = true
                self?.falseButton.isUserInteractionEnabled = true
            case .failure(_):
                let alert = UIAlertController(title: "Trivia", message: "There has been an error, try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func nextQuestion() {
        viewModel.currentQuestionIndex += 1
        if !viewModel.questions.isEmpty {
            if viewModel.currentQuestionIndex < viewModel.questions.count {
                questionLabel.text = viewModel.getCurrentQuestion()
            }
            if viewModel.currentQuestionIndex >= viewModel.questions.count - 2 || viewModel.questions.count <= 2 {
                getQuestions()
            }
        }
    }

    @objc private func trueButtonHandler() {
        let result = viewModel.questions[viewModel.currentQuestionIndex].correctAnswer.lowercased() == "true"
        let alert = UIAlertController(title: "Trivia", message: result ? "Good job!" : "You missed one, keep trying!", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            alert.dismiss(animated: true, completion: nil)
            self?.nextQuestion()
        }
    }

    @objc private func falseButtonHandler() {
        let result = viewModel.questions[viewModel.currentQuestionIndex].correctAnswer.lowercased() == "false"
        let alert = UIAlertController(title: "Trivia", message: result ? "Good job!" : "You missed one, keep trying!", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            alert.dismiss(animated: true, completion: nil)
            self?.nextQuestion()
        }
    }
}
