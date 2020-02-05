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
    func setSNP() {
        
        setDatePicker()
        setButton()
    }

    
    // Create DatePicker with UIPickerView
    func setDatePicker() {
        datePicker = UIPickerView()
        
        view.addSubview(datePicker)
        datePicker.delegate = self
        datePicker.dataSource = self
        
        datePicker.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(-20)
        }
    }
    
    // Set SNP to nextButton
    func setButton() {

        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(datePicker.snp.top).inset(-80)
//            make.top.equalTo(200)
        }
    }
}
