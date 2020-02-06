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
import SnapKit
import RealmSwift

class StartViewController: BaseViewController {
    //    var database: Firestore!
    @IBOutlet weak var startButton: UIButton!
    
    static func instance(viewModel: HomeViewModel) -> StartViewController? {
        let startViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "StartViewController") as? StartViewController
        startViewController?.homeViewModel = viewModel
        return startViewController
    }
    
    fileprivate var homeViewModel: HomeViewModel?
    
//    init(viewModel: HomeViewModel) {
//        homeViewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    /// custom setup
    override func setup() {
        super.setup()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func setupButton(button: UIButton) {
        super.setupButton(button: startButton)
        button.setTitle("시작하기", for: .normal)
        
        button.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
    }
    
    
    override func setupUI() {
        super.setupUI()
        setupButton(button: startButton)
        
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(36)
            make.bottom.equalTo(-80)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        let settings = FirestoreSettings()
        //        Firestore.firestore().settings = settings
        //        database = Firestore.firestore()
        //        // Do any additional setup after loading the view.
        //
        //        database.collection("presents").getDocuments() { (querySnapshot, err) in
        //            if let err = err {
        //                print("Error getting documents: \(err)")
        //            } else {
        //                for document in querySnapshot!.documents {
        //                    print("\(document.documentID) => \(document.data())")
        //                }
        //            }
        //        }
        
    }
}

extension StartViewController: HomeViewControllerable {
    func next() {
        homeViewModel?.startBtnTapped()
    }
    
    func prev() {
        
    }
    
    func storeData() {
        homeViewModel?.storeStart(name: "123123123")
    }
    
    
}

private extension StartViewController {
    @objc
    func startBtnTapped() {
        next()
        storeData()
    }
}
