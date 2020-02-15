//
//  Presents.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/11.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift
import FirebaseFirestore

class Presents: Object {
    let presents = List<Present>()
}
