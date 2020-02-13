//
//  PirceViewController+layout.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension PriceViewController {
    /*
    // setup self view properties
    // setup self view contraints
    // add subviews
    // setup subviews properties
    */
    
    func setupUI() {
        // setup self view properties
        // setup self view contraints
        // add subviews
        view.addSubview(backButton)
        view.addSubview(skipButton)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
        view.addSubview(priceGroup)
        
        // setup subviews properties
        setupBackButton()
        setupSkipButton()
        setupDescriptionLabel()
        setupNextButton()
        setupPriceGroup()
    }
    
    private func setupBackButton() {
    // MARK: 리소스 추가 예정
        // setup self view properties
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(.veryLightPink, for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        
        // setup self view contraints
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(22)
        }
    }
    
    private func setupSkipButton() {
        
        // setup self view properties
        skipButton.setTitle("건너뛰기", for: .normal)
        skipButton.setTitleColor(.blueGrey, for: .normal)
        skipButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        
        // setup self view contraints
        skipButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            make.right.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(21)
        }
    }
    
    private func setupDescriptionLabel() {
        
        // setup self view properties
        descriptionLabel.text = "얼마 정도 생각하시나요?"
        descriptionLabel.textColor = .brownishGrey
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        // setup self view contraints
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(103)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(33)
        }
    }
    
    private func setupNextButton() {
        
        // setup self view properties
        nextButton.setNextButton(isEnable: true, title: "다음")
        
        // setup self view contraints
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(28)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(52)
        }
    }
    
    private func setupPriceGroup() {
        
        // setup self view properties
        priceGroup.axis  = .horizontal
        priceGroup.distribution  = .fillProportionally
        priceGroup.alignment = .center
        priceGroup.spacing   = 16.0
        
        // setup self view contraints
        priceGroup.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(41)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(41)
        }
        
        // add subviews
        priceGroup.addArrangedSubview(minPriceLabel)
        priceGroup.addArrangedSubview(tildeLabel)
        priceGroup.addArrangedSubview(maxPriceLabel)
        priceGroup.addArrangedSubview(wonPriceLabel)
        
        // setup subviews properties
        setupPriceLabels()
    }
    
    private func setupPriceLabels() {
        
        minPriceLabel.text = "1"
        minPriceLabel.font = .systemFont(ofSize: 34, weight: .bold)
        minPriceLabel.sizeToFit()
        
        tildeLabel.text = "~"
        tildeLabel.font = .systemFont(ofSize: 34, weight: .bold)
        tildeLabel.sizeToFit()
        
        maxPriceLabel.text = "10"
        maxPriceLabel.font = .systemFont(ofSize: 34, weight: .bold)
        maxPriceLabel.sizeToFit()
        
        wonPriceLabel.text = "만원"
        wonPriceLabel.font = .systemFont(ofSize: 34, weight: .bold)
        wonPriceLabel.sizeToFit()
    }
}
