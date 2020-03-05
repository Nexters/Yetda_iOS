//
//  BirthdayViewController+UIPickerView.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/24.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit


extension BirthdayViewController: UIPickerViewDelegate {
    
    // Set UIPickerView to have two columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Set UIPickerView total length for each columns
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
    
    // UIPickerView: show months and days as columns
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            monthDay.month = months[row]
            setLabelInput(monthLabel, text: String(format: "%02d", row+1))
        } else {
            monthDay.day = days[row]
            dateLabel.text = String(format: "%02d", row+1)
            setLabelInput(dateLabel, text: String(format: "%02d", row+1))
        }
        
        if monthDay.month != nil && monthDay.day != nil {
            nextButton.setNextButton(isEnable: true)
        }
    }
}

