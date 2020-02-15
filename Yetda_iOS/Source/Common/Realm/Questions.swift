//
//  Questions.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/15.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift
import FirebaseFirestore

class Questions: Object {
    let questions = List<Question>()
}
