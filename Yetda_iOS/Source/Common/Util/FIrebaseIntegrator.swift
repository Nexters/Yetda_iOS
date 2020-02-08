//
//  FIrebaseIntegrator.swift
//  Yetda_iOS
//
//  Created by Jung seoung Yeo on 2020/01/17.
//  Copyright © 2020 Yetda. All rights reserved.
//

import FirebaseCore
import FirebaseFirestore

class FIrebaseIntegrator: NSObject, Integratorable {
    
    private var db: Firestore?
    
    override init() {
        super.init()
    }
    
    func initIntegrator(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        FirebaseApp.configure()
        db = Firestore.firestore()
    }
}
