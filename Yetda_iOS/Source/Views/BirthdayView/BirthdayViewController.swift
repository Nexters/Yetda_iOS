//
//  BirthdayViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

// Ref: https://github.com/bendodson/MonthYearPickerView-Swift/blob/master/MonthYearPickerView.swift

import UIKit
import SnapKit

class BirthdayViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var months: [String]! = []
    var days: [String]! = []
    var datePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        setDatePicker()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
