//
//  NameViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/23.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension NameViewController {
    
    
    func setButton() {
        setupButton(button: nextButton)
        
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    func setVerticalStackView() {
        verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .green
        
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { (make) in
        make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
        make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        make.bottom.equalTo(nextButton.snp_topMargin).offset(-20)
        make.top.equalTo(200)
            }
    }
    
    func setGuideLabel() {
        guideLabel = UILabel()
        guideLabel.numberOfLines = 0
        guideLabel.text = """
        선물 줄 분의 이름이
        어떻게 되시나요?
        """
        guideLabel.textColor = .darkGray
        
        verticalStackView.addSubview(guideLabel)
        
        // Set SNP Constraints
        guideLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
        }
    }
    
    func setNameTextField() {
        nameTextField = UITextField()
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "이름"
        nameTextField.delegate = self
        
        // CreateBottom Border with UIView
        bottomBorderView = UIView()
        if nameTextField.isSelected {
            bottomBorderView.backgroundColor = .darkGray
        } else {
            bottomBorderView.backgroundColor = .lightGray
        }
        
        verticalStackView.addSubview(nameTextField)
        verticalStackView.addSubview(bottomBorderView)
        
        nameTextField.snp.makeConstraints { (make) in
            make.topMargin.equalTo(guideLabel.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)

        }
        
        bottomBorderView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(nameTextField.snp_bottomMargin).offset(20)
            make.trailing.equalTo(verticalStackView)
            make.leading.equalTo(verticalStackView)
            make.height.equalTo(2)
        }
    }
    
}
