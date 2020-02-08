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
        view.addSubview(descriptionLabel)
        view.addSubview(femaleButton)
        view.addSubview(maleButton)
        
        // setup subviews properties
        setupNextButton()
        setupDescriptionLabel()
        setupFemaleButton()
        setupMaleButton()
    }
    
    // Set nextButton
    func setupNextButton() {
        
        // setup self view properties
        nextButton.setNextButton(isEnable: true)
        
        // setup self view contraints
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(24)
            make.bottom.equalTo(self.view).inset(50)
            make.height.equalTo(44)
        }
    }
    
    func setupDescriptionLabel() {
        
        // setup self view properties
        descriptionLabel.text = "쭈피님의 성별은?"
        descriptionLabel.textColor = .brownishGrey
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        // setup self view contraints
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).inset(103)
            make.centerX.equalTo(self.view)
        }
    }
    
    func setupFemaleButton() {
        
        // setup self view properties
        femaleButton.setEnable(true)
        
        // setup self view contraints
        femaleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel).offset(40)
            make.right.equalTo(self.view.snp.centerX).offset(-11)
            make.width.height.equalTo(100)
        }
    }
    
    func setupMaleButton() {
        
        // setup self view properties
        maleButton.setEnable(false)
        
        // setup self view contraints
        maleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.descriptionLabel).offset(40)
            make.left.equalTo(self.view.snp.centerX).offset(11)
            make.width.height.equalTo(100)
        }
    }
}
