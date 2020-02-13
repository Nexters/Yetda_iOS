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
    
    var backButton = UIButton()
    var skipButton = UIButton()
    var descriptionLabel = UILabel()
    
    var monthGroup = UIView()
    var monthLabel = UILabel()
    var monthLineGroup = UIView()
    var monthLine1 = UIView()
    var monthLine2 = UIView()
    
    var slashLabel = UILabel()
    
    var dateGroup = UIView()
    var dateLabel = UILabel()
    var dateLineGroup = UIView()
    var dateLine1 = UIView()
    var dateLine2 = UIView()
    
    var nextButton = UIButton()
    
    var months: [String]! = []
    var days: [String]! = []
    var datePicker: UIPickerView!
    var monthDay = MonthDay()
    
    static func instance(viewModel: HomeViewModel) -> BirthdayViewController? {
        let birthdayViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "BirthdayViewController") as? BirthdayViewController
        birthdayViewController?.homeViewModel = viewModel
        return birthdayViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        // Do any additional setup after loading the view.
    }
    
    // custom setup
    override func setup() {
        super.setup()

        setupUI()
//        setDatePicker()
        
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
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
}

extension BirthdayViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStringAnswer(actionType: ActionType.birthday, payload: "\(monthDay.month!) \(monthDay.day!)")
    }
}

private extension BirthdayViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
}
