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
    func setScrollView() {
        self.view.addSubview(scrollView)
        
        
        // Set SNP to scrollView
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        _ = [guideLabelView, imageView, subText,cardView].map { self.contentView.addSubview($0)}
        
        self.view.addSubview(startButton)
        
        startButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(18)
            make.top.equalToSuperview().offset(808)
        }
        
        
        setGuideText()
        setImage()
        setSubText()
        setCardView()
    }
    
    func setGuideText() {
        guideLabelView.addSubview(guideText)
//        self.scrollView.addSubview(guideLabelView)
        
        guideText.text = "선물 추천 받으러 \n가볼까요?"
        guideText.numberOfLines = 0
        guideText.textColor = .black
        guideText.font = .systemFont(ofSize: 34)
        guideText.sizeToFit()
        
        guideLabelView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(106)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(82)
            
        }
    }
    
        func setImage() {
    //        self.scrollView.addSubview(imageView)
            imageView.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().inset(26)
                make.top.equalTo(guideLabelView.snp.bottom).offset(84)
                
            }
            
            
        }
    
    func setSubText() {

            subText.text = "선물 추천 기록"
            subText.textColor = .brownishGrey
            subText.font = .systemFont(ofSize: 20)

            subText.snp.makeConstraints { (make) in
                make.top.equalTo(imageView.snp.bottom).offset(23.7)
                make.leading.equalToSuperview().offset(22)
            }
        }

    
    func setCardView() {
        cardView.setCardView()
        
        cardView.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(subText.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(500)
            make.bottom.equalToSuperview() // 이것이 중요함
            
        }
    }
    
    
    
}
