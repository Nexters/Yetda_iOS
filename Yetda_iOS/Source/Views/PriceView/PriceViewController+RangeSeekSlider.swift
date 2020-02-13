//
//  PriceViewController+RangeSeekSlider.swift
//  Yetda_iOS
//
//  Created by 임수현 on 2020/02/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RangeSeekSlider

extension PriceViewController: RangeSeekSliderDelegate{
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minPriceLabel.text = "\(Int(minValue))"
        maxPriceLabel.text = "\(Int(maxValue))"
    }
}
