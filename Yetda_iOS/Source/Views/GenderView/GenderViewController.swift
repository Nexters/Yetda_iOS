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
        createCheckboxStackView()
           
       }
       
       override func setupButton(button: UIButton) {
           super.setupButton(button: nextButton)
           button.setTitle("다음", for: .normal)
       }

    
    
    // Styles and SnapKit Implementations
    func createCheckboxStackView() {
        view.addSubview(horizontalStackView)
        //init button
        createRadioButton(view: femaleCheckBox, button: femaleButton)
        createRadioButton(view: maleCheckBox, button: maleButton)
        
        horizontalStackView.addSubview(femaleCheckBox)
        horizontalStackView.addSubview(femaleLabel)
        horizontalStackView.addSubview(maleCheckBox)
        horizontalStackView.addSubview(maleLabel)
        
        horizontalStackView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(300)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(33)
        }
        
        setLabelsAndButtons()
        
    }
    
    func setButton() {
        setupButton(button: nextButton)
        
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    func setCommonLabelSetup(label: UILabel, title: String) {
        label.text = title
        label.tintColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(33)
//            make.left.edges.equalTo(26)
        }
        
        // Further label settings
    }
    
    func setLabelsAndButtons() {
        setCommonLabelSetup(label: femaleLabel, title: "여성")
        femaleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(femaleButton.snp.right).inset(-14)
        }
        
        setCommonLabelSetup(label: maleLabel, title: "남성")
        maleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(maleButton.snp.right).inset(-14)
        }
        
        setButtonAction(button: femaleButton)
//        setButtonStyle(button: femaleButton)
        femaleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(26)
//            make.width.height.equalTo(16)
        }
        
        setButtonAction(button: maleButton)
//        setButtonStyle(button: maleButton)
        maleCheckBox.snp.makeConstraints { (make) in
            make.left.equalTo(femaleLabel.snp.rightMargin).inset(-59)
//            make.width.height.equalTo(16)
        }
        
    }
    
//    func setButtonAction(button: UIButton) {
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//    }
//    
//    @objc func buttonAction(sender: UIButton!) {
//        if sender.backgroundColor == .gray {
//            sender.backgroundColor = .clear
//        } else {
//            sender.backgroundColor = .gray
//        }
//        
//        if sender == maleButton {
//            femaleButton.backgroundColor = .clear
//        } else {
//            maleButton.backgroundColor = .clear
//        }
//    }
    
//    func setButtonStyle(button: UIButton) {
//        button.backgroundColor = .clear
//        button.layer.cornerRadius = 13
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.gray.cgColor
//    }

}
