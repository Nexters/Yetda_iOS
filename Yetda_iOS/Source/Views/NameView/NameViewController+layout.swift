//
//  NameViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/23.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension NameViewController {
    
    /*
     1. setup self view properties
     2. setup self view contraints
     3. add subviews
     4. setup subviews properties
    */

    func setButton() {
        
        // setup self view properties
        setupButton(button: nextButton)
        
        // setup self view contraints
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    func setVerticalStackView() {
        
        view.addSubview(verticalStackView)
        
        // setup self view properties
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .green
        
        // setup self view contraints
        verticalStackView.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(nextButton.snp_topMargin).offset(-20)
            make.top.equalTo(200)
        }
        
        // add subviews
        verticalStackView.addSubview(guideLabel)
        verticalStackView.addSubview(nameTextField)
        verticalStackView.addSubview(bottomBorderView)
        
        // setup subviews properties
        setGuideLabel()
        setNameTextField()
        setBottomBorderView()
    }
    
    func setGuideLabel() {
        
        // setup self view properties
        guideLabel.numberOfLines = 0
        guideLabel.text = """
                        선물 줄 분의 이름이
                        어떻게 되시나요?
                        """
        guideLabel.textColor = .darkGray
        
        // Set SNP Constraints
        guideLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
        }
    }
    
    func setNameTextField() {
        
        // setup self view properties
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "이름"
        nameTextField.delegate = self
        
        // setup self view contraints
        nameTextField.snp.makeConstraints { (make) in
            make.topMargin.equalTo(guideLabel.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
        }
    }
    
    func setBottomBorderView() {
        
        // setup self view properties
        if nameTextField.isSelected {
            bottomBorderView.backgroundColor = .darkGray
        } else {
            bottomBorderView.backgroundColor = .lightGray
        }
        
        // setup self view contraints
        bottomBorderView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(nameTextField.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
            make.height.equalTo(2)
        }
    }
}
