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

    func setButtonUI() {
        
        // setup self view properties
        nextButton.setNextButton(isEnable: false)
        
        // setup self view contraints
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(24)
            make.bottom.equalTo(self.view).inset(50)
            make.height.equalTo(44)
        }
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
        nameTextField.font = .boldSystemFont(ofSize: 34)
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
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
        bottomBorderView.backgroundColor = .blueGrey
        
        // setup self view contraints
        bottomBorderView.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom)
            make.left.right.equalTo(nameTextField)
            make.height.equalTo(2)
        }
    }
}
