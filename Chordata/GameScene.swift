//
//  GameScene.swift
//  Chordata
//
//  Created by Dan on 8/8/15.
//  Copyright (c) 2015 Dan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, UITextViewDelegate {
    var pianoKeyModels : [PianoKeyModel]!
    var pianoKeyNodes : [SKSpriteNode]!
    var clearButton : SKSpriteNode!
    var lastTouchStartTime : NSDate?
    var chordLabelNode: SKLabelNode!
    var scaleDataTextView: UITextView!
    var shouldUpdate: Bool = false
    
    var xSceneOffset = -0
    var ySceneOffset = 640
    
    override func didMoveToView(view: SKView) {
      
        self.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.5, alpha: 1.0)
        self.lastTouchStartTime = nil
        
        self.chordLabelNode = SKLabelNode(text: "");
        self.chordLabelNode.fontSize = 30
        self.chordLabelNode.fontName = "AvenirNext-Bold"
        self.chordLabelNode.text = ""
        self.chordLabelNode.position = CGPointMake(UIScreen.mainScreen().bounds.size.width  / 2, 500)
        self.addChild(self.chordLabelNode)
        
        
        
        scaleDataTextView = UITextView(frame: CGRectMake(view.bounds.width / 2 - 360, view.bounds.height / 2 - 100, 820, 440))
        scaleDataTextView.delegate = self
        scaleDataTextView.textColor = UIColor(red: 0.2, green: 0.7, blue: 0.7, alpha: 1.0)
        scaleDataTextView.font = UIFont(name: "AvenirNext-Bold", size: 30)
        scaleDataTextView.backgroundColor = SKColor.clearColor()
        scaleDataTextView.editable = false
        view.addSubview(scaleDataTextView)
        
        self.clearButton = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(80, 30))
        let clearLabel = SKLabelNode(text: "Clear")
        clearLabel.fontSize = 20
        clearLabel.fontName = "AvenirNext-Bold"
        clearLabel.fontColor = UIColor.whiteColor()
        clearLabel.position = CGPointMake(0, -8)
        self.clearButton.addChild(clearLabel)
        self.clearButton.position = CGPointMake(UIScreen.mainScreen().bounds.size.width  / 2 + 400, 510)
        self.addChild(self.clearButton)
        
        createPianoKeys()
    }
    
    
    func createPianoKeys() {
        self.pianoKeyModels = PianoKeyModel.getPianoKeyModels()
        self.pianoKeyNodes = [SKSpriteNode]()
        
        var xOffset = 0
        
        for (var keyIndex = 0; keyIndex < self.pianoKeyModels.count; keyIndex++) {
            let keyModel = self.pianoKeyModels[keyIndex]
            var keyNode : SKSpriteNode
            
            let labelText = keyModel.primaryPianoKeyIdentity.keyBase.description + keyModel.primaryPianoKeyIdentity.keyModifier.description
            
            let labelNode = SKLabelNode(text: labelText)
            labelNode.fontSize = 14
            labelNode.zPosition = 3
            labelNode.fontName = "AvenirNext-Bold"

            
            if (keyModel.isWhiteKey) {
                xOffset++
                keyNode = SKSpriteNode(color: keyModel.defaultColor, size: CGSizeMake(66,160) )
                keyNode.position = CGPointMake( CGFloat(xOffset * 68 + xSceneOffset), CGFloat(ySceneOffset))
                labelNode.position.y = -70
                labelNode.fontColor = UIColor.blackColor()
            } else {
                let wrapperNode = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(50,112) )
                wrapperNode.position = CGPointMake( CGFloat(xOffset * 68 + 36 + xSceneOffset), CGFloat(ySceneOffset + 24))
                wrapperNode.zPosition = 1
                self.addChild(wrapperNode)
                
                keyNode = SKSpriteNode(color: keyModel.defaultColor, size: CGSizeMake(46,110) )
                keyNode.position = CGPointMake( CGFloat(xOffset * 68 + 36 + xSceneOffset), CGFloat(ySceneOffset + 25))
                keyNode.zPosition = 2
                labelNode.position.y = -50
                labelNode.fontColor = UIColor.whiteColor()
            }
            
            keyNode.userData = NSMutableDictionary()
            keyNode.userData!.setObject(keyModel, forKey: "keyModel")
            keyNode.addChild(labelNode)
            self.pianoKeyNodes.append(keyNode)
            
            self.addChild(keyNode)
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
  
        for touch in touches {
            let location = touch.locationInNode(self)
            
            for touchedNode in self.nodesAtPoint(location) {
                let touchedSkNode = touchedNode as? SKSpriteNode
                if (touchedSkNode != nil) {
                    if (touchedSkNode == self.clearButton) {
                        for keyNode in self.pianoKeyNodes {
                            let keyModel = keyNode.userData!.objectForKey("keyModel") as! PianoKeyModel
                            keyModel.isSelected = false
                            keyNode.color = keyModel.defaultColor
                        }
                        self.shouldUpdate = true
                        self.lastTouchStartTime = NSDate()
                        return
                    }
                    
                    if (touchedSkNode?.userData != nil) {
                        let pianoKeyModel = touchedSkNode?.userData!.objectForKey("keyModel") as! PianoKeyModel
                        if (pianoKeyModel.isSelected!) {
                            pianoKeyModel.isSelected = false
                            touchedSkNode!.color = pianoKeyModel.defaultColor
                        } else {
                            pianoKeyModel.isSelected = true
                            touchedSkNode!.color = UIColor.redColor()

                        }
                        self.shouldUpdate = true
                        self.lastTouchStartTime = NSDate()
                        break
                    }
                }
            }
        }
    }
   
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
     
        if (shouldUpdate) {
            if (self.lastTouchStartTime != nil) {
                let diff = self.lastTouchStartTime!.timeIntervalSinceNow * -1000.0
                
                if (diff > 50) {
                    // Do chord lookup
                    
                    self.chordLabelNode.text = "Chord"
                    
                    // Show chord
                    var chordLabelText = ""
                    var noteCounter : Int = 0
                    var noteIndices = [Int]()
                    var chordRoot = ""
                    for keyModel in self.pianoKeyModels {
                        if (noteIndices.count > 0) {
                            noteCounter++
                        }
                        
                        if (keyModel.isSelected!) {
                            
                            let moddedCounter = noteCounter % 12
                            
                            var alreadySeen = false
                            for existingIndex in noteIndices {
                                if (moddedCounter == existingIndex) {
                                    alreadySeen = true
                                    break
                                }
                            }
                            
                            if (!alreadySeen) {
                            
                                if (chordLabelText != "") {
                                    chordLabelText += ", "
                                }
                                let noteDescription = keyModel.primaryPianoKeyIdentity.keyBase.description + keyModel.primaryPianoKeyIdentity.keyModifier.description
                                if (chordRoot == "" ) {
                                    chordRoot = noteDescription
                                }
                                chordLabelText += noteDescription
                            
                                noteIndices.append(moddedCounter)
                            }
                        }
                    }
                    noteIndices = noteIndices.sort()
                    
                    if (noteIndices.count == 0) {
                        chordLabelText = ""
                    } else {
                        chordLabelText += " " + noteIndices.description
                    }
                    
                    self.chordLabelNode.text = chordLabelText;
                    
                    
                    // Find all scales that match. 
                    var scalesDescription : String = ""
                    
                    for scaleDefinition in ScaleDefinition.getScaleDefinitions() {
                        // Ensure all notes in chord match the scale
                        var allExist : Bool = true
                        for noteIndex in noteIndices {
                            var keyFound = false
                            for scaleKey in scaleDefinition.keys {
                                if (scaleKey == noteIndex) {
                                    keyFound = true
                                    break
                                }
                            }
                            if (!keyFound) {
                                allExist = false
                                break
                            }
                        }
                        if (allExist) {
                            // Add to list of scales
                            if (scalesDescription != "") {
                                scalesDescription += "\r\n"
                            }
                            scalesDescription += chordRoot + " " + scaleDefinition.name + " " + scaleDefinition.keys.description
                        }
                        
                    }
                    
                    if (noteIndices.count == 0) {
                        scaleDataTextView.text = ""
                    } else {
                        scaleDataTextView.text = scalesDescription
                    }
                    self.shouldUpdate = false
                    
                }
            }
      
        }
    }
}
