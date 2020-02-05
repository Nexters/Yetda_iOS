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
    
    private var name: String?
    
    public lazy var homeViewController: [HomeViewControllerable] = {
        let viewControllers: [HomeViewControllerable] = [StartViewController.instance(viewModel: self)!,
                               NameViewController.instance(viewModel: self)!,
                               StartViewController.instance(viewModel: self)!]
        return viewControllers
    }()
    
    weak var delegate: HomeViewModelable?
    
    public func startBtnTapped() {
        print("startBtnTapped")
        
        
        delegate?.next(viewController: homeViewController[1])
    }
    
    public func storeStart(name: String) {
        print("\(name)")
        self.name = name
    }
}
