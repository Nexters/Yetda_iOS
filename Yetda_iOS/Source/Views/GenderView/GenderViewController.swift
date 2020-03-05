//
//  GenderViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/27.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class GenderViewController: BaseViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    var backButton = UIButton()
    var skipButton = UIButton()
    var descriptionLabel = UILabel()
    var femaleButton = GenderToggleButton(title: "여성")
    var maleButton = GenderToggleButton(title: "남성")
    var selectedGender = Gender.female
    var answer: Answer?
    
    enum Gender {
        case female, male
    }
    
    static func instance(viewModel: HomeViewModel) -> GenderViewController? {
        let genderViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "GenderViewController") as? GenderViewController
        genderViewController?.homeViewModel = viewModel
        return genderViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let gender = homeViewModel?.answer.gender else {
            clickGenderToggleButton(femaleButton)
            return
        }
        
        if gender == "female" {
            clickGenderToggleButton(femaleButton)
        } else {
            clickGenderToggleButton(maleButton)
        }
    }
    
    // custom setup
    override func setup() {
        super.setup()
        answer = homeViewModel?.answer
        
        setupUI()
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
}

extension GenderViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        homeViewModel?.backBtnTapped()
    }
    
    func storeData() {
        print("store gender: \(selectedGender)")
        
        if selectedGender == Gender.female {
            homeViewModel?.storeStringAnswer(actionType: ActionType.gender, payload: "female")
        } else {
            homeViewModel?.storeStringAnswer(actionType: ActionType.gender, payload: "male")
        }
    }
}

private extension GenderViewController {
    @objc
    func nextBtnTapped() {
        storeData()
        next()
    }
    
    @objc
    func backBtnTapped() {
        prev()
    }
    
    @objc
    func skipButtonTapped() {
        next()
    }
}
