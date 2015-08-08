//
//  ScaleDefinitions.swift
//  Chordata
//
//  Created by Dan on 8/8/15.
//  Copyright © 2015 Dan. All rights reserved.
//


public class ScaleDefinition {
    
    public init (name: String, keys: [Int]) {
        self.name = name
        self.keys = keys
    }
    
    var name : String
    var keys : [Int]
    
    
    
    static func getScaleDefinitions() -> [ScaleDefinition] {
        var retval = [ScaleDefinition]()
        
        retval.append( ScaleDefinition(name: "a", keys: [0,4,7]) )
        retval.append( ScaleDefinition(name: "b", keys: [0,4,8]) )

        return retval
    }
}