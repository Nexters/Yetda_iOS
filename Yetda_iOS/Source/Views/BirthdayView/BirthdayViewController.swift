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
    }
    
    // Change Button title to "다음"
    override func setupButton(button: UIButton) {
        super.setupButton(button: nextButton)
        button.setTitle("다음", for: .normal)
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
    
    // MARK: - apply layout from extension
    override func setupUI() {
        super.setupUI()
        setupButton(button: nextButton)
        setSNP()
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

extension BirthdayViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStart(name: "123123123")
    }
    
    
}

private extension BirthdayViewController {
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
