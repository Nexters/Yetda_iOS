//
//  Receivers.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/02/04.
//  Copyright © 2020 Yetda. All rights reserved.
//

import Foundation
import RealmSwift

class Results: Object {
    let receivers = List<Receiver>()
}
