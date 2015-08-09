//
//  ScaleDefinitions.swift
//  Chordata
//
//  Created by Dan on 8/8/15.
//  Copyright © 2015 Dan. All rights reserved.
//


public class ScaleDefinition {
    
    public init (name: String,  keys: [Int]) {
        self.name = name
        self.keys = keys
    }
    
    var name : String
    var keys : [Int]
    
    
    
    static func getScaleDefinitions() -> [ScaleDefinition] {
        var retval = [ScaleDefinition]()
        
        retval.append( ScaleDefinition(name: "Acoustic scale", keys: 	[0,2,4,6,7,9,10]))
        retval.append( ScaleDefinition(name: "Aeolian mode or natural minor scale", keys: 	[0,2,3,5,7,8,10]))
        retval.append( ScaleDefinition(name: "Algerian scale", keys: 	[0,2,3,6,7,8,11]))
        retval.append( ScaleDefinition(name: "Altered scale", keys: 	[0,1,3,4,6,8,10]))
        retval.append( ScaleDefinition(name: "Augmented scale", keys: 	[0,3,4,7,8,11]))
        retval.append( ScaleDefinition(name: "Bebop dominant scale", keys: 	[0,2,4,5,7,9,10,11]))
        retval.append( ScaleDefinition(name: "Blues scale", keys: 	[0,3,5,6,7,10]))
        retval.append( ScaleDefinition(name: "Dorian mode", keys: 	[0,2,3,5,7,9,10]))
        retval.append( ScaleDefinition(name: "Double harmonic scale", keys: 	[0,1,4,5,7,8,11]))
        retval.append( ScaleDefinition(name: "Enigmatic scale", keys: 	[0,1,4,6,8,10,11]))
        retval.append( ScaleDefinition(name: "Flamenco mode", keys: 	[0,1,4,5,7,8,11]))
        retval.append( ScaleDefinition(name: "Gypsy scale[a]", keys: 	[0,2,3,6,7,8,10]))
        retval.append( ScaleDefinition(name: "Half diminished scale", keys: 	[0,2,3,5,6,8,10]))
        retval.append( ScaleDefinition(name: "Harmonic major scale", keys: 	[0,2,4,5,7,8,11]))
        retval.append( ScaleDefinition(name: "Harmonic minor scale", keys: 	[0,2,3,5,7,8,11]))
        retval.append( ScaleDefinition(name: "Hirajoshi scale", keys: 	[0,2,3,7,8]))
        retval.append( ScaleDefinition(name: "Hungarian Gypsy scale[a]", keys: 	[0,2,3,6,7,8,11]))
        retval.append( ScaleDefinition(name: "Hungarian minor scale", keys: 	[0,2,3,6,7,8,11]))
        retval.append( ScaleDefinition(name: "In scale", keys: 	[0,1,5,7,8]))
        retval.append( ScaleDefinition(name: "Insen scale", keys: 	[0,1,5,7,10]))
        retval.append( ScaleDefinition(name: "Ionian mode or major scale", keys: 	[0,2,4,5,7,9,11]))
        retval.append( ScaleDefinition(name: "Istrian scale", keys: 	[0,1,3,4,6,7]))
        retval.append( ScaleDefinition(name: "Iwato scale", keys: 	[0,1,5,6,10]))
        retval.append( ScaleDefinition(name: "Locrian mode", keys: 	[0,1,3,5,6,8,10]))
        retval.append( ScaleDefinition(name: "Lydian augmented scale", keys: 	[0,2,4,6,8,9,11]))
        retval.append( ScaleDefinition(name: "Lydian mode", keys: 	[0,2,4,6,7,9,11]))
        retval.append( ScaleDefinition(name: "Major bebop scale", keys: 	[0,2,4,5,7,8,9,11]))
        retval.append( ScaleDefinition(name: "Major Locrian scale", keys: 	[0,2,4,5,6,8,10]))
        retval.append( ScaleDefinition(name: "Major pentatonic scale", keys: 	[0,2,4,7,9]))
        retval.append( ScaleDefinition(name: "Melodic minor scale", keys: 	[0,2,3,5,7,9,11]))
        retval.append( ScaleDefinition(name: "Melodic minor scale(ascending)", keys: 	[0,2,3,5,7,9,11]))
        retval.append( ScaleDefinition(name: "Minor pentatonic scale", keys: 	[0,3,5,7,10]))
        retval.append( ScaleDefinition(name: "Mixolydian mode or Adonai malakh mode", keys: 	[0,2,4,5,7,9,10]))
        retval.append( ScaleDefinition(name: "Neapolitan major scale", keys: 	[0,1,3,5,7,9,11]))
        retval.append( ScaleDefinition(name: "Neapolitan minor scale", keys: 	[0,1,3,5,7,8,11]))
        retval.append( ScaleDefinition(name: "Octatonic scale A", keys: 	[0,2,3,5,6,8,9,11]))
        retval.append( ScaleDefinition(name: "Octatonic scale B", keys:    [0,1,3,4,6,7,9,10]))
        retval.append( ScaleDefinition(name: "Persian scale", keys: 	[0,1,4,5,6,8,11]))
        retval.append( ScaleDefinition(name: "Phrygian dominant scale", keys: 	[0,1,4,5,7,8,10]))
        retval.append( ScaleDefinition(name: "Phrygian mode", keys: 	[0,1,3,5,7,8,10]))
        retval.append( ScaleDefinition(name: "Prometheus scale", keys: 	[0,2,4,6,9,10]))
        retval.append( ScaleDefinition(name: "Tritone scale", keys: 	[0,1,4,6,7,10]))
        retval.append( ScaleDefinition(name: "Ukrainian Dorian scale", keys: 	[0,2,3,6,7,9,10]))
        retval.append( ScaleDefinition(name: "Whole tone scale", keys: 	[0,2,4,6,8,10]))
        retval.append( ScaleDefinition(name: "Yo scale", keys: 	[0,3,5,7,11]))
       
        return retval
    }
}