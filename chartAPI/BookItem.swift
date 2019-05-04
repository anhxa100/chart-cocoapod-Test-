//
//  BookItem.swift
//  chartAPI
//
//  Created by anhxa100 on 5/4/19.
//  Copyright © 2019 anhxa100. All rights reserved.
//

import Foundation
import  RealmSwift

@objcMembers class BookItem: Object {
    enum Property: String {
        case id, name, isCompleted
    }
    
    dynamic var id = UUID().uuidString
    dynamic var name = ""
    dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return BookItem.Property.id.rawValue
    }
    
    convenience init(_ name: String) {
        self.init()
        self.name = name
    }
}

extension BookItem {
    static func add(name: String, in realm: Realm = try! Realm()) -> BookItem {
        let book = BookItem(name)
        try! realm.write {
            realm.add(book)
        }
        return book
    }
}
