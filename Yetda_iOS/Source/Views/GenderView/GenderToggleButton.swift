//
//  GenderToggleButton.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/08.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

class GenderToggleButton: UIButton {

    private var isOn: Bool = false {
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
    
    required init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        setting()
    }

}

extension GenderToggleButton {
    
    func setEnable(_ enable: Bool){
        isOn = enable
    }
}

extension GenderToggleButton {
    private func setting() {
        self.frame.size = CGSize(width: 100, height: 100)
        self.layer.cornerRadius = 50
        self.layer.borderWidth = 2
        self.titleLabel?.font = .systemFont(ofSize: 26, weight: .bold)
        self.isOn = false

        self.addTarget(self, action: #selector(clickToggleButton), for: .touchUpInside)
    }

    private func changedToggleState() {
        if isOn {
            self.layer.borderColor = UIColor.pastelRed.cgColor
            self.setTitleColor(.pastelRed, for: .normal)
        } else {
            self.layer.borderColor = UIColor.paleLilac.cgColor
            self.setTitleColor(.paleLilac, for: .normal)
        }
    }
    
    @IBAction private func clickToggleButton() {
        isOn = !isOn
    }
}
