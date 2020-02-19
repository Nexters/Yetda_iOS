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
    var contentView = UIView()
    var cardView = UIView()
    var imageView = UIImageView(image: UIImage(named: "artboard14X")!)
    var guideText = UILabel()
    var subText = UILabel()
    
    static func instance(viewModel: HomeViewModel) -> ResultViewController? {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        resultViewController?.homeViewModel = viewModel
        return resultViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
    override func setup() {
        setupUI()
        backButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
