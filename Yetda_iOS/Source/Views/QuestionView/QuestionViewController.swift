//
//  QuestionViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionViewController: BaseViewController {
    var basePoint = 5
    
    let cardSize = CGSize(width: 302, height: 362)
    
    let frontCardView: UIView = UIView()
    let middleCardView: UIView = UIView()
    let backCardView: UIView = UIView()
    let frontCardLabel: UILabel = UILabel()
    
    let descriptionLabel: UILabel = UILabel()
    let yesButton: UIButton = UIButton()
    let noButton: UIButton = UIButton()
    let midButton: UIButton = UIButton()
    var secondCard = UIView()
    
    // Question and Answer related logics
    var answer: Answer?
//    var question: Question?
    var presents: Results<Presents>?
//    var questionNum = 0
    
    var presentBrain = PresentBrain(minPrice: 0, maxPrice: 10)
    
    
    static func instance(viewModel: HomeViewModel) -> QuestionViewController? {
        let questionViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "QuestionViewController") as? QuestionViewController
        questionViewController?.homeViewModel = viewModel
        return questionViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer = homeViewModel?.answer
//        var question = presentBrain.findQuestion()
//        print("question in main: \(question)")
        
        if let unWrappedAnswer = answer {
            presentBrain = PresentBrain(minPrice: unWrappedAnswer.minPrice!, maxPrice: unWrappedAnswer.maxPrice!)
            presentBrain.findPresents()
            presentBrain.findQuestion()
        } 
        
//        presentBrain.find
//        presentBrain.findPresents()
        setupView()
        setupButtonAction()
    }
    
}

extension QuestionViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStringAnswer(actionType: ActionType.tag, payload: "선물")
    }
    
    
}

extension QuestionViewController {
    func goToResult() {
        print("let's GOGO: \(presentBrain.presents), min/max: \(presentBrain.maxPrice)")
        next()
    }
    
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
