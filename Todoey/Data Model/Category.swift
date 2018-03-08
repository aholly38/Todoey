//
//  Category.swift
//  Todoey
//
//  Created by Alain on 3/7/18.
//  Copyright © 2018 Alain Holly. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
    
}
