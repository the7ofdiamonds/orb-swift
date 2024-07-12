//
//  StorageUserDefaults.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import Foundation

actor StorageUserDefaults {
    static let instance = StorageUserDefaults()
    
    func set(key: String, value: Any) -> Bool {
        UserDefaults.standard.setValue(value, forKey: key)
        
        if let valueExist = get(key),
           "\(value)" == "\(valueExist)" {
            return true
        } else {
            return false
        }
    }
    
    func get(_ key: String) -> Any? {
        guard let value = UserDefaults.standard.value(forKey: key) else {
            return nil
        }
        
        return value
    }
    
    func delete(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
