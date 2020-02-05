//
//  HomePageViewController.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/05.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

protocol HomeViewControllerable {
    func next()
    func prev()
    func storeData()
}

class HomePageViewController: UIPageViewController {
    
    private lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        guard let firstVC = viewModel.homeViewController.first as? BaseViewController else { return }
        
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
}

extension HomePageViewController: UIPageViewControllerDelegate {
    
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}

extension HomePageViewController: HomeViewModelable {
    func next(viewController: HomeViewControllerable) {
        guard let vc = viewController as? BaseViewController else { return }
        setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
    
    func prev() {
        
    }
    
    
}
