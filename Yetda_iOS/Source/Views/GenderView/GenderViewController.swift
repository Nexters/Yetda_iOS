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
    var descriptionLabel = UILabel()
    var femaleButton = GenderToggleButton(title: "여성")
    var maleButton = GenderToggleButton(title: "남성")
    var selectedGender = Gender.female
    
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
    
    // custom setup
    override func setup() {
        super.setup()
        
        setupUI()
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
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
        homeViewModel?.storeStart(name: "123123123")
    }
}

private extension GenderViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
    
    @objc
    func backBtnTapped() {
        prev()
    }
}
