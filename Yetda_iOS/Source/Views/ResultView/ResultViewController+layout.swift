//
//  ResultViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/16.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

extension ResultViewController {
    func setupUI() {
        setContentView()
        setButtonUI()
        setGuideText()
        setCardView()
        setImageView()
        setPresentTextView()
        setSubTextView()
        setotherPresentText()
    }
    
    func setButtonUI() {
        self.contentView.addSubview(backButton)
        backButton.setNextButton(isEnable: true, title: "처음으로 돌아가기")
        
        // setup self view contraints
        backButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(24)
            make.bottom.equalTo(self.view).inset(50)
            make.height.equalTo(44)
        }
    }
    
    func setContentView() {
        self.view.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setGuideText() {
        self.contentView.addSubview(guideText)
        if let name = answer?.name {
            guideText.text = "\(name)님을 위한 추천선물"
        }
        guideText.numberOfLines = 0
        guideText.font = .systemFont(ofSize: 20)
        guideText.textColor = .brownishGrey
        
        guideText.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
    }
    
    func setCardView() {
        contentView.addSubview(cardView)
        cardView.setCardView()
        cardView.addSubview(imageView)
        
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(guideText.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.width.equalTo(338)
            make.height.equalTo(460)
        }
    }
    
    func setPresentTextView() {
        self.contentView.addSubview(presentText)
        presentText.text = present?.present ?? "마카롱과 디저트"
        presentText.font = .systemFont(ofSize: 30)
        presentText.textColor = .black
        
        presentText.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
            make.top.equalTo(imageView.snp.bottom).offset(28)
        }
    }
    
    func setSubTextView() {
        self.contentView.addSubview(subText)
        subText.text = "술을 좋아한다면 실패 없을 선물이에요"
        subText.font = .systemFont(ofSize: 18)
        subText.textColor = .brownishGrey
        
        subText.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(presentText.snp.bottom).offset(18)
        }
    }
    
    
    func setotherPresentText() {
        self.contentView.addSubview(otherPresentText)
        otherPresentText.text = "또 다른 선물은?"
        otherPresentText.font = .systemFont(ofSize: 20)
        otherPresentText.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        otherPresentText.underline()
        
        otherPresentText.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(cardView.snp.bottom).offset(44)
        }
    }
    
    func setImageView() {
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(40)
        }
    }
}
