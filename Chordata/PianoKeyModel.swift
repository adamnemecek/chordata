//
//  PianoKeyModel.swift
//  Chordata
//
//  Created by Dan on 8/8/15.
//  Copyright © 2015 Dan. All rights reserved.
//

import Foundation
import SpriteKit

public class PianoKeyModel {
    init (primaryPianoKeyIdentity: PianoKeyIdentity, secondaryPianoKeyIdentity: PianoKeyIdentity?, isWhiteKey: Bool, octave: Int) {
        self.primaryPianoKeyIdentity = primaryPianoKeyIdentity
        self.secondaryPianoKeyIdentity = secondaryPianoKeyIdentity
        self.isWhiteKey = isWhiteKey
        self.octave = octave
        
        if (self.isWhiteKey) {
            self.defaultColor = UIColor.whiteColor()
        } else {
            self.defaultColor = UIColor.blackColor()
        }

    }
    
    var primaryPianoKeyIdentity: PianoKeyIdentity
    var secondaryPianoKeyIdentity: PianoKeyIdentity?
    var isWhiteKey: Bool
    var octave: Int
    var defaultColor: UIColor
    
    
    static func getPianoKeyModels() -> [PianoKeyModel] {
        var retval = [PianoKeyModel]()
    
        for (var i = 0; i < 2; i++ ) {
            // C
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.C, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i
                ))
            
            // C#/Db
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.C, keyModifier: KeyModifier.Sharp),
                secondaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.D, keyModifier: KeyModifier.Flat),
                isWhiteKey: false ,
                octave: i))
            
            // D
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.D, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))
            
            // D#/Eb
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.D, keyModifier: KeyModifier.Sharp),
                secondaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.E, keyModifier: KeyModifier.Flat),
                isWhiteKey: false,
                octave: i ))
            
            // E
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.E, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))
            
            // F
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.F, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))
            
            // F#/Gb
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.F, keyModifier: KeyModifier.Sharp),
                secondaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.G, keyModifier: KeyModifier.Flat),
                isWhiteKey: false,
                octave: i ))
            
            // G
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.G, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))

            // G#/Ab
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.G, keyModifier: KeyModifier.Sharp),
                secondaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.A, keyModifier: KeyModifier.Flat),
                isWhiteKey: false,
                octave: i ))

            // A
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.A, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))
            
            // A#/Bb
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.A, keyModifier: KeyModifier.Sharp),
                secondaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.B, keyModifier: KeyModifier.Flat),
                isWhiteKey: false,
                octave: i ))
            
            // B
            retval.append( PianoKeyModel( primaryPianoKeyIdentity: PianoKeyIdentity(keyBase: KeyBase.B, keyModifier: KeyModifier.None),
                secondaryPianoKeyIdentity: nil,
                isWhiteKey: true,
                octave: i ))
                
        }
        
        return retval
    }
}

public class PianoKeyIdentity {
    init(keyBase: KeyBase, keyModifier : KeyModifier) {
        self.keyBase = keyBase
        self.keyModifier = keyModifier
    }
    
    var keyBase : KeyBase
    var keyModifier : KeyModifier
}

public enum KeyBase {
    case C
    case D
    case E
    case F
    case G
    case A
    case B
    

    var description : String {
        switch self {
            // Use Internationalization, as appropriate.
            case .C: return "C";
            case .D: return "D";
            case .E: return "E";
            case .F: return "F";
            case .G: return "G";
            case .A: return "A";
            case .B: return "B";

        }
    }
}

public enum KeyModifier {
    case None
    case Sharp
    case Flat
    
    var description : String {
        switch self {
            // Use Internationalization, as appropriate.
            case .None: return "";
            case .Sharp: return "#";
            case .Flat: return "b";
        }
    }
}