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
    func prev(viewController: HomeViewControllerable)
}

class HomeViewModel: NSObject {
    
    private var idx = 0
    var answer = Answer()
    
    public lazy var homeViewController: [HomeViewControllerable] = {
        let viewControllers: [HomeViewControllerable] = [StartViewController.instance(viewModel: self)!,
                               NameViewController.instance(viewModel: self)!,
                               GenderViewController.instance(viewModel: self)!,
                               BirthdayViewController.instance(viewModel: self)!,
                               PriceViewController.instance(viewModel: self)!,
                               QuestionViewController.instance(viewModel: self)!,
                               ResultViewController.instance(viewModel: self)!
        ]
        return viewControllers
    }()
    
    weak var delegate: HomeViewModelable?
    
    public func startBtnTapped() {
        print("startBtnTapped")
        
        let len = homeViewController.count
        if idx < len {
            idx += 1
            delegate?.next(viewController: homeViewController[idx])
        }
    }
    
    public func backBtnTapped() {
        print("backButtonTapped")
        
        if idx >= 1 {
            idx -= 1
            delegate?.next(viewController: homeViewController[idx])
        }
    }
    
    public func backToStartBtnTapped() {
        idx = 0
        delegate?.next(viewController: StartViewController.instance(viewModel: self)!)
        answer = Answer()
        homeViewController = {
            let viewControllers: [HomeViewControllerable] = [StartViewController.instance(viewModel: self)!,
                                   NameViewController.instance(viewModel: self)!,
                                   GenderViewController.instance(viewModel: self)!,
                                   BirthdayViewController.instance(viewModel: self)!,
                                   PriceViewController.instance(viewModel: self)!,
                                   QuestionViewController.instance(viewModel: self)!,
                                   ResultViewController.instance(viewModel: self)!
            ]
            return viewControllers
        }()
    }
    
    public func storeStringAnswer(actionType: ActionType, payload: String) {
        print("store payload: \(payload)")
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
        print("stored answer:\(answer)")
    }
    
    public func storeSelectedPresents(payload: [Present]) {
        answer.presents = payload
    }
        
    public func storePrice(minPrice: Int, maxPrice: Int) {
        print("store data: \(minPrice) \(maxPrice)")
        answer.minPrice = minPrice
        answer.maxPrice = maxPrice
    }
}
