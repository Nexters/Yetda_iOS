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
    
    // Common Settings for CheckBox Label
    func setCommonLabelSetup(label: UILabel, title: String) {
        label.text = title
        label.tintColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(33)
        }
    }
    
    // Set SNP to CheckBox labels and buttons
    func setLabelsAndButtons() {
        setCommonLabelSetup(label: femaleLabel, title: "여성")
        femaleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(femaleButton.snp.right).inset(-14)
        }
        
        setCommonLabelSetup(label: maleLabel, title: "남성")
        maleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(maleButton.snp.right).inset(-14)
        }
        
        setButtonAction(button: femaleButton)
        femaleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(26)
        }
        
        setButtonAction(button: maleButton)
        maleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(femaleLabel.snp.rightMargin).inset(-59)
        }
        
    }
    
    // Set CheckBox button style
    func setButtonStyle(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(16)
        }
    }
    
    // Add CheckBox button action
    func setButtonAction(button: UIButton) {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    // male/female Buttons are mutually exclusive when selecting
    @objc func buttonAction(sender: UIButton!) {
        if sender.backgroundColor == .charcoalGrey {
            sender.backgroundColor = .clear
        } else {
            sender.backgroundColor = .charcoalGrey
        }
        
        if sender == maleButton {
            femaleButton.backgroundColor = .clear
        } else {
            maleButton.backgroundColor = .clear
        }
    }
    
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
        setButtonStyle(button: button)
        setButtonAction(button: button)
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
}
