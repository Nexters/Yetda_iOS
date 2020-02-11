//
//  Presents.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/11.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift

class Database: Object {
    @objc dynamic var updated_at = "now"
    let presents = List<Present>()
    let questions = List<Question>()
}
