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
    
    static func instance(viewModel: HomeViewModel) -> ResultViewController? {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        resultViewController?.homeViewModel = viewModel
        return resultViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        // Do any additional setup after loading the view.
    }
        
}

extension ResultViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
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
