//
//  Question.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/11.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    @objc dynamic var question = ""
    @objc dynamic var tag = ""
    @objc dynamic var isAsked = false
}
