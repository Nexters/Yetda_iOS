//
//  ResultViewController.swift
//  Yetda_iOS
//
//  Created by Leon Kong on 2020/01/13.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    let results = Results()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Test Cases
        let gift1 = Gift()
        gift1.name = "향수"
        gift1.tags.append("뷰티")
        gift1.tags.append("실용")
        
        let gift2 = Gift()
        gift2.name = "꽃다발"
        gift2.tags.append("여성")
        gift2.tags.append("감성")
        
        let receiver = Receiver()
        receiver.name = "May"
        receiver.gifts.append(gift1)
        receiver.gifts.append(gift2)
        
        results.receivers.append(receiver)
        
        writeRealmData(data: results)
        
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(results)
//            }
//            let outcome = realm.objects(Results.self)
//            print(outcome[0].receivers)
//
//        } catch let error as NSError {
//            // handle error
//            print(error)
//        }
    }
    
    func writeRealmData(data: Results) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(data)
            }
            let retreivedData = realm.objects(Results.self)
            print(retreivedData[0].receivers)
            
        } catch let error as NSError {
            // handle error
            print(error)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
