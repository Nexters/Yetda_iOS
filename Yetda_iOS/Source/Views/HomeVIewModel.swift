//
//  HomeVIewModel.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/05.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

protocol HomeViewModelable: class {
    func next(viewController: HomeViewControllerable)
    func prev()
}

class HomeViewModel: NSObject {
    
//    private var name: String?
    private var idx = 0
    
//    enum ActionType {
//        case name, gender, birthday, minPrice, maxPrice, tag
//    }
    
    var answer = Answer()
    
    public lazy var homeViewController: [HomeViewControllerable] = {
        let viewControllers: [HomeViewControllerable] = [StartViewController.instance(viewModel: self)!,
                               NameViewController.instance(viewModel: self)!,
                               GenderViewController.instance(viewModel: self)!,
                               BirthdayViewController.instance(viewModel: self)!,
                               PriceViewController.instance(viewModel: self)!,
                               QuestionViewController.instance(viewModel: self)!
        ]
        return viewControllers
    }()
    
    weak var delegate: HomeViewModelable?
    
    public func startBtnTapped() {
        print("startBtnTapped")
        
        let len = homeViewController.count
        while idx < len {
            idx += 1
            delegate?.next(viewController: homeViewController[idx])
            break
        }
    }
    
    public func storeStringAnswer(actionType: ActionType, payload: String) {
            switch actionType {
            case ActionType.name:
                answer.name = payload
            case ActionType.gender:
                answer.gender = payload
            case ActionType.birthday:
                answer.birthday = payload
            default:
                if var tags = answer.tags {
                    tags.append(payload)
                } else {
                    answer.tags = []
                }
            }
    }
        
    public func storePrice(minPrice: Int, maxPrice: Int) {
        answer.minPrice = minPrice
        answer.maxPrice = maxPrice
    }
    
}
