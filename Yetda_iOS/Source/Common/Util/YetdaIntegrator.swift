//
//  YetdaIntegrator.swift
//  Yetda_iOS
//
//  Created by Jung seoung Yeo on 2020/01/17.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit

protocol Integratorable {
    func initIntegrator(launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

class YetdaIntegrator: NSObject {
    
    public static let shared = YetdaIntegrator()
    
    private var intergrators: [Integratorable] = []
    
    private let firebase = FIrebaseIntegrator()
    
    override init() {
        super.init()
        
        intergrators = [firebase]
    }
}

extension YetdaIntegrator {
    func appDidFinishLaunching(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        for intergrator in intergrators {
            intergrator.initIntegrator(launchOptions: launchOptions)
        }
    }
}
