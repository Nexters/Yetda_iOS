//
//  NameViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class NameViewController: BaseViewController {

    @IBOutlet weak var nextButton: UIButton!
    var guideLabel: UILabel!
    var nameTextField: UITextField!
    var verticalStackView: UIStackView!
    var bottomBorderView: UIView!
    
    static func instance(viewModel: HomeViewModel) -> NameViewController? {
        let nameViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NameViewController") as? NameViewController
        nameViewController?.homeViewModel = viewModel
        return nameViewController
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
    }
    
    // MARK: - apply layout from extension
    override func setupUI() {
        super.setupUI()
        
        setButton()
        setVerticalStackView()
        setGuideLabel()
        setNameTextField()
        
    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: nextButton)
        button.setTitle("다음", for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}

extension NameViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStart(name: "123123123")
    }
    
    
}

private extension NameViewController {
    @objc
    func nextBtnTapped() {
        next()
        storeData()
    }
}

