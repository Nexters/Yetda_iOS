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

class BirthdayViewController: BaseViewController, UIPickerViewDataSource {
    @IBOutlet weak var nextButton: UIButton!
    
    var months: [String]! = []
    var days: [String]! = []
    var datePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        
//        datePicker.delegate = self
//        datePicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // custom setup
    override func setup() {
        super.setup()
    }
    
    // MARK: - apply layout from extension
    override func setupUI() {
        super.setupUI()
        
        setSNP()
    }
    
    // populate months and days array
    func populateData() {
        for month in 1...12 {
            months.append(String("\(month)월"))
        }

        for day in 1...31 {
            days.append(String("\(day)일"))
        }
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
