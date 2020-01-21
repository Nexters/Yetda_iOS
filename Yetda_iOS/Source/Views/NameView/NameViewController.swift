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
    @IBOutlet weak var guideText: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var verticalView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor.lightGray
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /// custom setup
    override func setup() {
        super.setup()
        setupNextButton()
        setupGuideTextLabel()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: - Add AutoLayout to Button
    func setupNextButton() {
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 18
        nextButton.tintColor = .white
    }
    
    override func setupUI() {
        super.setupUI()
        
        nextButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
        verticalView.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
//            make.left.right.equalTo(20)
            
            make.top.equalTo(200)
        }
        

    }

    
    
    
    func setupGuideTextLabel() {
        guideText.text = """
        선물 줄 분의 이름이
        어떻게 되시나요?
        """
        guideText.textColor = .darkGray
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