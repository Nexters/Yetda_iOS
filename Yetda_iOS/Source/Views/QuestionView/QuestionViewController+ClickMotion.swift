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
    
        UIView.animate(withDuration: 0.3, animations: ({
            let movingDistance = self.view.frame.width
            self.frontCardView.transform = CGAffineTransform(translationX: -movingDistance, y: 0)
        }))
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showNextCard), userInfo: nil, repeats: false)
    }
    
    @IBAction func clickYesButton(sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, animations: ({
            let movingDistance = self.view.frame.width
            self.frontCardView.transform = CGAffineTransform(translationX: movingDistance, y: 0)
        }))
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showNextCard), userInfo: nil, repeats: false)
    }
    
    @objc func showNextCard() {
        
        questionNum += 1
        frontCardLabel.text = "Question\(questionNum)"
        
        if questionNum > basePoint {
            descriptionLabel.text = "\(answer!.name)님에 대해 조금만 더 알려주세요!"
        }
        
        frontCardLabel.alpha = 0
        frontCardView.transform = .identity
        
        UIView.animate(withDuration: 0.5, animations: ({
            self.frontCardLabel.alpha = 1
        }))
    }
    
    func setupButtonAction() {
        noButton.addTarget(self, action: #selector(clickNoButton), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(clickYesButton), for: .touchUpInside)
    }
}
