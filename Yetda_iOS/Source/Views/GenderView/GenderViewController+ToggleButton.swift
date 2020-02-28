//
//  GenderViewController+ToggleButton.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/09.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

extension GenderViewController {
    
    @IBAction func clickGenderToggleButton(_ sender: GenderToggleButton) {
        if sender == femaleButton {
            selectedGender = .female
            femaleButton.setOn(true)
            maleButton.setOn(false)
//            selectedGender = Gender.male
        } else {
            selectedGender = .male
            maleButton.setOn(true)
            femaleButton.setOn(false)
//            selectedGender = Gender.female
        }
    }
}
