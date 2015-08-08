//
//  GameScene.swift
//  Chordata
//
//  Created by Dan on 8/8/15.
//  Copyright (c) 2015 Dan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var pianoKeyModels : [PianoKeyModel]!
    var pianoKeyNodes : [SKSpriteNode]!
    var xSceneOffset = -0
    var ySceneOffset = 640
    
    override func didMoveToView(view: SKView) {
      
        self.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.5, alpha: 1.0)
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
       /* Called when a touch begins */
        
        clearAllStuff()
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            for touchedNode in self.nodesAtPoint(location) {
                let touchedSkNode = touchedNode as? SKSpriteNode
                if (touchedSkNode != nil) {
                    touchedSkNode!.color = UIColor.redColor()
                    break
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        clearAllStuff()
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            for touchedNode in self.nodesAtPoint(location) {
                let touchedSkNode = touchedNode as? SKSpriteNode
                if (touchedSkNode != nil) {
                    let pianoKeyModel = touchedSkNode?.userData!.objectForKey("keyModel") as! PianoKeyModel
                    touchedSkNode!.color = pianoKeyModel.defaultColor
                    break
                }
                
            }
        }
    }
  
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        clearAllStuff()
        
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            for touchedNode in self.nodesAtPoint(location) {
                let touchedSkNode = touchedNode as? SKSpriteNode
                if (touchedSkNode != nil) {
                    touchedSkNode!.color = UIColor.redColor()
                    break
                }
            }
        }
    }
    
    func clearAllStuff() {
        for node in self.pianoKeyNodes {
            let pianoKeyModel = node.userData!.objectForKey("keyModel") as! PianoKeyModel
            node.color = pianoKeyModel.defaultColor

        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
    }
}
