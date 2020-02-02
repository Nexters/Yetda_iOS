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
        self.view.addSubview(bottomBorderView)
        
        // setup subviews properties
        setBottomBorderView()
    }
    
    func setGuideLabel() {
        
        // setup self view properties
        guideLabel.text = "선물을 받을 사람은?"
        guideLabel.textColor = .brownishGrey
        guideLabel.font = .systemFont(ofSize: 18)
        guideLabel.sizeToFit()
        
        // Set SNP Constraints
        guideLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(200)
        }
    }
    
    func setNameTextField() {
        
        // setup self view properties
        nameTextField.borderStyle = .none
        nameTextField.textAlignment = .center
        nameTextField.delegate = self
        
        // setup self view contraints
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(guideLabel).offset(40)
            make.centerX.equalTo(self.view)
            make.left.equalTo(self.view).offset(75)
            make.right.equalTo(self.view).offset(-75)
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
