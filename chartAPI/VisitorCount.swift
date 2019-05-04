//
//  VisitorCount.swift
//  chartAPI
//
//  Created by anhxa100 on 5/3/19.
//  Copyright © 2019 anhxa100. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorCount: Object {
    @objc dynamic var date: Date = Date()
    @objc  dynamic var count: Int = Int(0)
    
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}
