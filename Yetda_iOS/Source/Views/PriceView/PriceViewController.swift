//
//  PriceViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class PriceViewController: BaseViewController {
    
    static func instance(viewModel: HomeViewModel) -> PriceViewController? {
        let priceViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PriceViewController") as? PriceViewController
        priceViewController?.homeViewModel = viewModel
        return priceViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    
    override func setup() {
        super.setup()
    }
    
//    override func setupUI() {
//        super.setupUI()
////        setupButton(button: nextButton)
////        setSNP()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PriceViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStart(name: "123123123")
    }
    
    
}

private extension PriceViewController {
    @objc
    func nextBtnTapped() {
        print("next button in start tapped")
        next()
        storeData()
    }
}
