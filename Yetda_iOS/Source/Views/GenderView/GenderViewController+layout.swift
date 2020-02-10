//
//  GenderViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/29.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

extension GenderViewController {
    
    /*
     1. setup self view properties
     2. setup self view contraints
     3. add subviews
     4. setup subviews properties
    */
    
    func setupUI() {
        // setup self view properties
        // setup self view contraints
        // add subviews
        view.addSubview(backButton)
        view.addSubview(skipButton)
        view.addSubview(descriptionLabel)
        view.addSubview(femaleButton)
        view.addSubview(maleButton)
        
        // setup subviews properties
        setupNextButton()
        setupBackButton()
        setupSkipButton()
        setupDescriptionLabel()
        setupFemaleButton()
        setupMaleButton()
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
    
    // Set nextButton
    private func setupNextButton() {
        
        // setup self view properties
        nextButton.setNextButton(isEnable: true)
        
        // setup self view contraints
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(44)
        }
    }
    
    private func setupDescriptionLabel() {
        
        // setup self view properties
        descriptionLabel.text = "쭈피님의 성별은?"
        descriptionLabel.textColor = .brownishGrey
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        // setup self view contraints
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(103)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setupFemaleButton() {
        
        // setup self view properties
        femaleButton.setEnable(true)
        femaleButton.addTarget(self, action: #selector(clickGenderToggleButton(_:)), for: .touchUpInside)
        
        // setup self view contraints
        femaleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel).offset(40)
            make.right.equalTo(self.view.snp.centerX).offset(-11)
            make.width.height.equalTo(100)
        }
    }
    
    private func setupMaleButton() {
        
        // setup self view properties
        maleButton.setEnable(false)
        maleButton.addTarget(self, action: #selector(clickGenderToggleButton(_:)), for: .touchUpInside)
        
        // setup self view contraints
        maleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel).offset(40)
            make.left.equalTo(self.view.snp.centerX).offset(11)
            make.width.height.equalTo(100)
        }
    }
}
