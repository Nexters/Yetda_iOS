//
//  ViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/07.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewController: UIViewController {
    var database: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        database = Firestore.firestore()
        // Do any additional setup after loading the view.

        database.collection("presents").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }

}

