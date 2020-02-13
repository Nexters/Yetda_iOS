//
//  PriceViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RangeSeekSlider

class PriceViewController: BaseViewController {
    
    var backButton = UIButton()
    var skipButton = UIButton()
    var descriptionLabel = UILabel()
    var nextButton = UIButton()
    
    var priceGroup = UIStackView()
    var minPriceLabel = UILabel()
    var tildeLabel = UILabel() //"~"
    var maxPriceLabel = UILabel()
    var wonPriceLabel = UILabel()
    
    var priceSlider = RangeSeekSlider()
    
    static func instance(viewModel: HomeViewModel) -> PriceViewController? {
        let priceViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PriceViewController") as? PriceViewController
        priceViewController?.homeViewModel = viewModel
        return priceViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setup() {
        super.setup()
        setupUI()
        
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
}

extension PriceViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        homeViewModel?.backBtnTapped()
    }
    
    func storeData() {
        homeViewModel?.storePrice(minPrice: 0, maxPrice: 10000)
    }
}

private extension PriceViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
    
    @objc
    func backButtonTapped() {
        prev()
    }
    
    @objc
    func skipButtonTapped() {
        next()
    }
}
