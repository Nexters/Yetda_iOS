//
//  Present.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/11.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift

class Present: Object {
    @objc dynamic var id = 0
    @objc dynamic var present = ""
    @objc dynamic var price = ""
    let tags = List<String>()
}
