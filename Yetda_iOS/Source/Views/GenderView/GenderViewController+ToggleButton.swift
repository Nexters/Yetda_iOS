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
            femaleButton.setEnable(true)
            maleButton.setEnable(false)
        } else {
            selectedGender = .male
            maleButton.setEnable(true)
            femaleButton.setEnable(false)
        }
    }
}
