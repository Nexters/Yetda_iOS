//
//  ResultViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: BaseViewController {
    var backButton =  UIButton()
    var cardView = UIView()
    
    static func instance(viewModel: HomeViewModel) -> ResultViewController? {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        resultViewController?.homeViewModel = viewModel
        return resultViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func setup() {
        setButtonUI()
        backButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setButtonUI() {
        backButton.setNextButton(isEnable: true, title: "처음으로 돌아가기")
        self.view.addSubview(backButton)
        
        // setup self view contraints
        backButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(24)
            make.bottom.equalTo(self.view).inset(50)
            make.height.equalTo(44)
        }
    }

        
}

extension ResultViewController: HomeViewControllerable {
    func next() {
//        homeViewModel?.startBtnTapped()
        print("처음으로 돌아가기")
    }
    
    func prev() {
        
    }
    
    func storeData() {
//        homeViewModel?.storeStringAnswer(actionType: ActionType.tag, payload: "선물")
    }
    
    
}

private extension ResultViewController {
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
