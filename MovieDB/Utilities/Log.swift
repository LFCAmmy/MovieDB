//
//  Log.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation

class Log {
    
    static let isLogEnabled: Bool = true
    
    class func start(info: String) {
        
        if isLogEnabled {
            print("\n---------------- \(info) ------------------- ")
        }
    }
    
    class func clear() {
        
        if isLogEnabled {
            print("\n--------------------------------------------\n")
        }
    }
    
    class func add(info: Any, fileName: String = #file, methodName: String = #function) {
        
        if isLogEnabled {
            print("› Log: [\(fileName.components(separatedBy: "/").last!.components(separatedBy: ".").first!).\(methodName)]: \(info)")
        }
    }
}
