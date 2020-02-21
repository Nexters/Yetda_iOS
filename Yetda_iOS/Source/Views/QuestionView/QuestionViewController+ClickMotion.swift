//
//  QuestionViewController+ClickMotion.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/01.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension QuestionViewController {
    
    @IBAction func clickNoButton(sender: UIButton) {
        print("NO!")
        
        presentBrain.handleQuestion(answerType: false)
    
        UIView.animate(withDuration: 0.3, animations: ({
            let movingDistance = self.view.frame.width
            self.frontCardView.transform = CGAffineTransform(translationX: -movingDistance, y: 0)
        }))
        
        if presentBrain.isContinue == false {
            presentBrain.questionNum = 0
            print("result")
            print(presentBrain.presents)
            storeData()
            goToResult()
        } else {
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showNextCard), userInfo: nil, repeats: false)
        }
    }
    
    @IBAction func clickYesButton(sender: UIButton) {
        print("YES!")
        presentBrain.handleQuestion(answerType: true)
        
        UIView.animate(withDuration: 0.3, animations: ({
            let movingDistance = self.view.frame.width
            self.frontCardView.transform = CGAffineTransform(translationX: movingDistance, y: 0)
        }))
        
        if presentBrain.isContinue == false {
            presentBrain.questionNum = 0
//            print("excluded: \(presentBrain.excludedTags), presents: \(presentBrain.presents)")
            
            print("result")
            print(presentBrain.presents)
            storeData()
            
            goToResult()
        } else {
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showNextCard), userInfo: nil, repeats: false)
        }
    }
    
    @objc func showNextCard() {
        let question = presentBrain.question
        presentBrain.questionNum += 1
        frontCardLabel.text = "\(question.question)"

        
        if presentBrain.questionNum > basePoint {
                if let name = answer?.name {
                    descriptionLabel.text = "\(name)님에 대해 조금만 더 알려주세요!"
                }
            }
            
            frontCardLabel.alpha = 0
            frontCardView.transform = .identity
            
            UIView.animate(withDuration: 0.5, animations: ({
                self.frontCardLabel.alpha = 1
            }))
        }
        
//        print("show next card")
//
//    }
    
    func setupButtonAction() {
        noButton.addTarget(self, action: #selector(clickNoButton), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(clickYesButton), for: .touchUpInside)
    }
}
