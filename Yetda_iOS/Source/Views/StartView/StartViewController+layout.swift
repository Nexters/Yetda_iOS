//
//  StartViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/15.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

extension StartViewController {
    func setImage() {
        let imageView = UIImageView(image: UIImage(named: "artboard14X")!)

        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.trailing).multipliedBy(0.237)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
            make.top.equalTo(self.additionalSafeAreaInsets).inset(272)
        }
        
        
    }
    
    func setGuideText() {
        let guideLabelView = UIView()
        guideLabelView.addSubview(guideText)
        self.view.addSubview(guideLabelView)
        
        guideText.text = "선물 추천 받으러 \n가볼까요?"
        guideText.numberOfLines = 0
        guideText.textColor = .black
        guideText.font = .systemFont(ofSize: 34)
        guideText.sizeToFit()
        
        guideLabelView.snp.makeConstraints { (make) in
            
            // Set SNP Constraints
            make.top.equalTo(self.view.safeAreaInsets).inset(106)
            make.leading.equalTo(self.view.snp.trailing).multipliedBy(0.058)
            
        }
    }
    
    func setCardView() {
        cardView.setCardView()
        self.view.addSubview(cardView)
        
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(583)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.894)
            make.height.equalTo(150)
            make.leading.equalTo(self.view.snp.trailing).multipliedBy(0.053)
            
        }
    }
    
    func setSubText() {
        self.view.addSubview(subText)
        
        subText.text = "선물 추천 기록"
        subText.textColor = .brownishGrey
        subText.font = .systemFont(ofSize: 20)
        
        subText.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaInsets).inset(538)
            make.leading.equalTo(self.view.snp.trailing).multipliedBy(0.053)
        }
    }
    
}
