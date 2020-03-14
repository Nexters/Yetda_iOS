//
//  Answer.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/08.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation

struct Answer {
    var name: String?
    var birthday: String?
    var gender: String?
    var minPrice: Int = 0
    var maxPrice: Int = 10
    var tags: [String]?
    var presents: [Present]?
}
