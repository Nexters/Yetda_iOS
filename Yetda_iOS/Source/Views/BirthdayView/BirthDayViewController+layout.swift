//
//  BirthDayViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/24.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension BirthdayViewController {
    
    // MARK: - UI and SNP configurations
    
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
        self.view.addSubview(backButton)
        self.view.addSubview(skipButton)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(slashLabel)
        self.view.addSubview(monthGroup)
        self.view.addSubview(dateGroup)
        self.view.addSubview(nextButton)
        
        // setup subviews properties
        setupBackButton()
        setupSkipButton()
        setupDescriptionLabel()
        setupSlashLabel()
        setupMonthGroup()
        setupDateGroup()
        setupNextButton()
    }
    
    func setupBackButton() {
        
        // setup self view properties
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(.veryLightPink, for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        
        // setup self view contraints
        backButton.snp.makeConstraints { (make) in             make.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(22)
        }
    }
    
    func setupSkipButton() {
        
        // setup self view properties
        skipButton.setTitle("건너뛰기", for: .normal)
        skipButton.setTitleColor(.blueGrey, for: .normal)
        skipButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        
        // setup self view contraints
        skipButton.snp.makeConstraints { (make) in          make.top.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            make.right.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(21)
        }
    }
    
    func setupDescriptionLabel() {
        
        // setup self view properties
        if let name = answer?.name {
            descriptionLabel.text = "\(name)님의 성별은?"
        }
        descriptionLabel.textColor = .brownishGrey
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .medium)

        // setup self view contraints
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(103)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(33)
        }
    }
    
    func setupSlashLabel() {
        
        // setup self view properties
        slashLabel.text = "/"
        slashLabel.textColor = .blueGrey
        slashLabel.font = .systemFont(ofSize: 24, weight: .medium)
        slashLabel.textAlignment = .center
        
        // setup self view contraints
        slashLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(44)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(14)
            make.height.equalTo(24)
        }
    }
    
    func setupMonthGroup() {
        monthGroup.backgroundColor = .blue
        
        // setup self view contraints
        monthGroup.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(41)
            make.right.equalTo(slashLabel.snp.left).offset(-6)
            make.height.equalTo(37)
        }
        
        // add subviews
        monthGroup.addSubview(monthLabel)
        monthGroup.addSubview(monthLine1)
        monthGroup.addSubview(monthLine2)
        
        // setup subviews properties
        setupMonthLabel()
        setupMonthLine()
    }
    
    func setupDateGroup() {
        dateGroup.backgroundColor = .blue
        
        // setup self view contraints
        dateGroup.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(41)
            make.left.equalTo(slashLabel.snp.right).offset(6)
            make.height.equalTo(37)
        }
        
        // add subviews
        dateGroup.addSubview(dateLabel)
        dateGroup.addSubview(dateLine1)
        dateGroup.addSubview(dateLine2)
        
        // setup subviews properties
        setupDateLabel()
        setupDateLine()
    }
    
    func setupMonthLabel() {
        
        // setup self view properties
        monthLabel.text = "MM"
        monthLabel.textColor = .paleLilac
        monthLabel.textAlignment = .center
        monthLabel.font = .systemFont(ofSize: 34, weight: .bold)
        
        // setup self view contraints
        monthLabel.snp.makeConstraints { (make) in
            make.top.right.equalTo(monthGroup)
        }
    }
    
    func setupMonthLine() {
        // setup self view properties
        monthLine1.backgroundColor = .paleLilac
        monthLine2.backgroundColor = .paleLilac
        
        // setup self view contraints
        monthLine1.snp.makeConstraints { (make) in
            make.top.equalTo(monthLabel.snp.bottom).offset(11)
            make.right.equalTo(monthLabel.snp.centerX).offset(-4)
            make.width.equalTo(22)
            make.height.equalTo(2)
        }
        
        monthLine2.snp.makeConstraints { (make) in
            make.top.equalTo(monthLabel.snp.bottom).offset(11)
            make.left.equalTo(monthLabel.snp.centerX).offset(4)
            make.width.equalTo(22)
            make.height.equalTo(2)
        }
    }
    
    func setupDateLabel() {
        
        // setup self view properties
        dateLabel.text = "DD"
        dateLabel.textColor = .paleLilac
        dateLabel.textAlignment = .center
        dateLabel.font = .systemFont(ofSize: 34, weight: .bold)
        
        // setup self view contraints
        dateLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(dateGroup)
        }
    }
    
    func setupDateLine() {
        // setup self view properties
        dateLine1.backgroundColor = .paleLilac
        dateLine2.backgroundColor = .paleLilac
        
        // setup self view contraints
        dateLine1.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(11)
            make.right.equalTo(dateLabel.snp.centerX).offset(-4)
            make.width.equalTo(22)
            make.height.equalTo(2)
        }
        
        dateLine2.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(11)
            make.left.equalTo(dateLabel.snp.centerX).offset(4)
            make.width.equalTo(22)
            make.height.equalTo(2)
        }
    }
    
    // Create DatePicker with UIPickerView
    func setDatePicker() {
        datePicker = UIPickerView()
        
        view.addSubview(datePicker)
        datePicker.delegate = self
        datePicker.dataSource = self
        
        datePicker.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(self.nextButton).inset(120)
        }
    }
    
    // Set SNP to nextButton
    func setupNextButton() {
        nextButton.setNextButton(isEnable: false)
        
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view.safeAreaLayoutGuide).inset(28)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(52)
        }
    }
}
