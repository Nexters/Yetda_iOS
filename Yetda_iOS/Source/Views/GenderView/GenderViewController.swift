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
    var femaleButton = UIButton()
    var maleButton = UIButton()
    var femaleLabel = UILabel()
    var maleLabel = UILabel()
    
    var femaleCheckBox = UIView()
    var maleCheckBox = UIView()
    
    var horizontalStackView = UIStackView()
    
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
        
            setButtonUI()
            nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
            createCheckboxStackView()
       }
       

}

extension GenderViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStringAnswer(actionType: ActionType.gender, payload: "female")
    }
    
    
}

private extension GenderViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
}
