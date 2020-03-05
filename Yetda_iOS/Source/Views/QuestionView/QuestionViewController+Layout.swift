//
//  QuestionViewController+Layout.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/01/15.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import SnapKit

extension QuestionViewController {
    
    /*
     1. setup self view properties
     2. setup self view contraints
     3. add subviews
     4. setup subviews properties
    */
    
    func setupView() {  // 전체 뷰
        
        // add subviews
        self.view.addSubview(descriptionLabel)
        
        // Stacked card views
        self.view.addSubview(backCardView)
        self.view.addSubview(middleCardView)
        self.view.addSubview(frontCardView)
        
        // Buttons
        self.view.addSubview(noButton)
        self.view.addSubview(yesButton)
        self.view.addSubview(midButton)
        
        // setup subviews properties
        setupDescriptionLabel()
        setupBackCardView()
        setupMiddleCardView()
        setupFrontCardView()
        setupYNButton()
        setupMidButton()
    }
    
    private func setupDescriptionLabel() {
        
        // setup self view properties
        if let name = answer?.name {
            descriptionLabel.text = "\(name)님은 어떤 사람인가요?"
        }
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.textColor = UIColor.brownishGrey
        descriptionLabel.sizeToFit()
        
        // setup self constraints
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(164)
        }
    }
    
    private func setupFrontCardView() {  // 현재 카드 뷰 부분
    
        // setup self view properties
        frontCardView.setCardView()
        
        // setup self view contraints
        frontCardView.snp.makeConstraints { (make) in
            make.width.equalTo(cardSize.width)
            make.height.equalTo(cardSize.height)
            make.center.equalTo(self.view)
        }
        
        // add subviews
        frontCardView.addSubview(frontCardLabel)
        
        // setup subviews properties
        setupFrontCardLabel()
    }
    
    private func setupMiddleCardView() {  // 뒤에 깔려있는 카드 뷰 부분
        
        // setup self view properties
        middleCardView.setCardView(radius: 12)
        
        
        // setup self view contstraints
        middleCardView.snp.makeConstraints { (make) in
            make.width.equalTo(cardSize.width - 45)
            make.height.equalTo(cardSize.height)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-12)
        }
    }
    
    private func setupBackCardView() { // 가장 밑 카드
        // setup self view properties
        backCardView.setCardView(radius: 10)
        
        // setup self view contstraints
        backCardView.snp.makeConstraints { (make) in
            make.width.equalTo(cardSize.width - 84)
            make.height.equalTo(cardSize.height)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-24)
        }
    }
    
    
    
    private func setupFrontCardLabel() { // 가장 위 카드의 레이블 설정
        
        // setup self view properties
        let question = presentBrain.question
        
        frontCardLabel.text = "\(question.question)"
        
        frontCardLabel.numberOfLines = 0
        frontCardLabel.font = .systemFont(ofSize: 34)
        frontCardLabel.textAlignment = .center
        
        
        // setup self view contraints
        frontCardLabel.snp.makeConstraints { (make) in
            make.center.equalTo(frontCardView)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupYNButton() {  // 예 아니오 버튼 부분
        
        // setup self view properties
        noButton.setYesNoButton(isYesBtn: false)
        yesButton.setYesNoButton(isYesBtn: true)
        
        // setup self view contraints
        noButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(76)
            make.top.equalTo(self.frontCardView.snp.bottom).offset(35)
            make.right.equalTo(self.view.snp.centerX).offset(-13)
        }
        
        yesButton.snp.makeConstraints { (make) in
        make.width.height.equalTo(76)
            make.top.equalTo(self.frontCardView.snp.bottom).offset(35)
            make.left.equalTo(self.view.snp.centerX).offset(13)
        }
    }
    
    private func setupMidButton() {
        
        // setup self view properties
        midButton.setTitle("잘 모르겠어요", for: .normal)
        midButton.setTitleColor(.blueGreyWith(alpha: 0.35), for: .normal)
        midButton.titleLabel?.font = .systemFont(ofSize: 18)
        midButton.setUnderLine()
        
        // setup self view contraints
        midButton.snp.makeConstraints { (make) in
            make.height.equalTo(19)
            make.top.equalTo(noButton.snp.bottom).offset(36)
            make.centerX.equalTo(self.view)
        }
    }
}
