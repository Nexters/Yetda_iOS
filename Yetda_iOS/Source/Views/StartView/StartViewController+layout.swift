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
    
    func setLabel() {
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
}
