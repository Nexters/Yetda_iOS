//
//  GenderToggleButton.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/03.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class GenderToggleButton: UIButton {
    
    var isOn: Bool = false {
        didSet {
            changedToggleState()
        }
    }
    
    // storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setting()
    }
    
    // programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setting()
    }
    
    private func setting() {
        self.frame.size = CGSize(width: 92, height: 92)
        self.layer.cornerRadius = 46
        self.layer.borderWidth = 2
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .black)
        self.isOn = false
        
        self.addTarget(self, action: #selector(clickToggleButton), for: .touchUpInside)
    }
    
    func changedToggleState() {
        if isOn {
            self.layer.borderColor = UIColor.pastelRed.cgColor
            self.setTitleColor(.pastelRed, for: .normal)
        } else {
            self.layer.borderColor = UIColor.paleLilac.cgColor
            self.setTitleColor(.paleLilac, for: .normal)
        }
    }
    
    @IBAction func clickToggleButton() {
        isOn = !isOn
    }
}
