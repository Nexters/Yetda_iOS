//
//  CheckBox.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/29.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

extension GenderViewController {
    
    // Set nextButton
    func setButton() {
        setupButton(button: nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    // Styles and SnapKit Implementations
    func createCheckboxStackView() {
        view.addSubview(horizontalStackView)
        
        // Init CheckBox with Button and container View
        setCheckBox(view: femaleCheckBox, button: femaleButton)
        setCheckBox(view: maleCheckBox, button: maleButton)
        
        horizontalStackView.addSubview(femaleCheckBox)
        horizontalStackView.addSubview(femaleLabel)
        horizontalStackView.addSubview(maleCheckBox)
        horizontalStackView.addSubview(maleLabel)
        
        horizontalStackView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(300)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(33)
        }
        
        setLabelsAndButtons()
        
    }
    
    
    // Set SNP to CheckBox labels and buttons
    func setLabelsAndButtons() {
        femaleLabel.setCommonLabelSetup(title: "여성")
        femaleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(femaleButton.snp.right).inset(-14)
        }
        
        maleLabel.setCommonLabelSetup(title: "남성")
        maleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(maleButton.snp.right).inset(-14)
        }
        
        maleButton.setButtonTag(tagId: 0)
        femaleButton.setButtonAction()
        femaleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(26)
        }
        
        maleButton.setButtonTag(tagId: 1)
        maleButton.setButtonAction()
        maleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(femaleLabel.snp.rightMargin).inset(-59)
        }
        
    }
    
//    // Set CheckBox button style
//    func setButtonStyle(button: UIButton) {
//        button.backgroundColor = .clear
//        button.layer.cornerRadius = 8
//
//        button.snp.makeConstraints { (make) in
//            make.width.height.equalTo(16)
//        }
//    }
    
    // Add CheckBox button action
//    func setButtonAction(button: UIButton) {
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//    }
//
//    // male/female Buttons are mutually exclusive when selecting
//    @objc func buttonAction(sender: UIButton!) {
//        if sender.backgroundColor == .charcoalGrey {
//            sender.backgroundColor = .clear
//        } else {
//            sender.backgroundColor = .charcoalGrey
//        }
//
//        if sender == maleButton {
//            femaleButton.backgroundColor = .clear
//        } else {
//            maleButton.backgroundColor = .clear
//        }
//    }
    
    // Outer Border of CheckBox Button
    func setButtonContainerView(view: UIView) {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 13
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.charcoalGrey.cgColor
        
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(26)
        }
        
    }
    
    
    func setCheckBox(view: UIView, button: UIButton) {
        setButtonContainerView(view: view)
        button.setButtonStyle()
//        button.setButtonAction(view: horizontalStackView)

        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
}

extension UIButton {
    // Set CheckBox button style
    func setButtonStyle() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        
        self.snp.makeConstraints { (make) in
            make.width.height.equalTo(16)
        }
    }
    
    func setButtonTag(tagId: Int) {
        self.tag = tagId
    }
    
    // Add CheckBox button action
    func setButtonAction() {
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    // male/female Buttons are mutually exclusive when selecting
    @objc func buttonAction(sender: UIButton!) {
        if sender.backgroundColor == .charcoalGrey {
            sender.backgroundColor = .clear
        } else {
            sender.backgroundColor = .charcoalGrey
        }

        
    }
    
    func setMutuallyExclusiveSelection(view: UIView!, selecedTag: Int) {
        switch selecedTag {
        case 0:
            view.viewWithTag(1)?.backgroundColor = .clear
        default:
            view.viewWithTag(0)?.backgroundColor = .clear
        }
    }
    

}
