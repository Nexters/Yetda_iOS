//
//  History.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/11.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift

class History: Object {
    @objc dynamic var date = ""
    @objc dynamic var birthday = ""
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    let presents = List<Present>()
}
