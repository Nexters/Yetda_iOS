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
    
    func setupView() {  // 전체 뷰
        
        self.view.addSubview(questionCardView)
        self.view.addSubview(noButton)
        self.view.addSubview(yesButton)
        self.view.addSubview(midButton)
        
        setupCardView()
        setupYNButton()
        setupMidButton()
    }
    
    private func setupCardView() {  // 카드 뷰 부분
        
        questionCardView.setCardView()
        
        questionCardView.snp.makeConstraints { (make) in
            make.width.equalTo(cardSize.width)
            make.height.equalTo(cardSize.height)
            make.center.equalTo(self.view)
        }
    }
    
    private func setupYNButton() {  // 예 아니오 버튼 부분
        
        noButton.setTitle("X", for: .normal)
        noButton.setTitleColor(UIColor.black, for: .normal)
        
        yesButton.setTitle("O", for: .normal)
        yesButton.setTitleColor(UIColor.black, for: .normal)
        
        noButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view.snp.left).offset((UIScreen.main.bounds.width - cardSize.width)/4)
        }
        
        yesButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view.snp.right).offset(-(UIScreen.main.bounds.width - cardSize.width)/4)
        }
    }
    
    private func setupMidButton() {
        
        midButton.setTitle("잘 모르겠어요", for: .normal)
        midButton.setTitleColor(.gray, for: .normal)
        midButton.titleLabel?.font = .systemFont(ofSize: 18)
        
        // 버튼에 밑줄
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        midButton.titleLabel?.attributedText = underlineAttributedString
        
        midButton.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(150)
            make.top.equalTo(questionCardView.snp.bottom).offset(33)
            make.centerX.equalTo(questionCardView)
        }
    }
}
