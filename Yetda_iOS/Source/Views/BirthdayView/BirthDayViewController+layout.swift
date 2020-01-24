//
//  BirthDayViewController+layout.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/24.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension BirthdayViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return months.count
        case 1:
            return days.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return days[row]
        default:
            return nil
        }
    }
    
    func populateData() {
        for month in 1...12 {
            months.append(String("\(month)월"))
        }
        
        for day in 1...31 {
            days.append(String("\(day)일"))
        }
    }
    
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
}
