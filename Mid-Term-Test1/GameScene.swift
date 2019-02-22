//
//  GameScene.swift
//  Mid-Term-Test1
//
//  Created by Aleixo Porpino Filho on 2019-02-21.
//  Copyright © 2019 Porpapps. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.zPosition = 0
        background.size = self.size
        self.addChild(background)
        
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.8)
        logo.setScale(0.45)
        logo.zPosition = 1
        self.addChild(logo)
        
        let lblCoins = SKLabelNode(fontNamed: "SystemBold")
        lblCoins.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.6)
        lblCoins.zPosition = 1
        lblCoins.text = "x01"
        lblCoins.fontSize = 35
        lblCoins.fontColor = SKColor.white
        self.addChild(lblCoins)
        
        let coin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        coin.position = CGPoint(x: self.size.width * 0.15, y: self.size.height * 0.61)
        coin.setScale(0.03)
        coin.zPosition = 1
        self.addChild(coin)
        
        let lblJackpot = SKLabelNode(fontNamed: "SystemBold")
        lblJackpot.position = CGPoint(x: self.size.width * 0.7, y: self.size.height * 0.6)
        lblJackpot.zPosition = 1
        lblJackpot.text = "Jackpot: 5000"
        lblJackpot.fontSize = 35
        lblJackpot.fontColor = SKColor.white
        self.addChild(lblJackpot)
        
        let lblPlayerStats = SKLabelNode(fontNamed: "SystemBold")
        lblPlayerStats.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.7)
        lblPlayerStats.zPosition = 1
        lblPlayerStats.text = "W:0 L:0 WR:0.0% T:0"
        lblPlayerStats.fontSize = 35
        lblPlayerStats.fontColor = SKColor.white
        self.addChild(lblPlayerStats)
        
        let block1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block1.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.45)
        block1.zPosition = 1
        block1.setScale(0.12)
        self.addChild(block1)
        
        let block2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block2.setScale(0.12)
        block2.zPosition = 1
        block2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.45)
        self.addChild(block2)
        
        let block3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        block3.setScale(0.12)
        block3.zPosition = 1
        block3.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.45)
        self.addChild(block3)
        
        let toad = SKSpriteNode(imageNamed: "toad")
        toad.setScale(0.12)
        toad.zPosition = 1
        toad.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.2)
        self.addChild(toad)
        
        let lblBet = SKLabelNode(fontNamed: "SystemBold")
        lblBet.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        lblBet.zPosition = 2
        lblBet.text = "Bet x10"
        lblBet.fontSize = 50
        lblBet.fontColor = SKColor.black
        self.addChild(lblBet)
        
        let lblBetMinus = SKLabelNode(fontNamed: "SystemBold")
        lblBetMinus.position = CGPoint(x: self.size.width * 0.45, y: self.size.height * 0.13)
        lblBetMinus.zPosition = 2
        lblBetMinus.text = "-"
        lblBetMinus.fontSize = 140
        lblBetMinus.fontColor = SKColor.black
        self.addChild(lblBetMinus)
        
        let lblBetPlus = SKLabelNode(fontNamed: "SystemBold")
        lblBetPlus.position = CGPoint(x: self.size.width * 0.55, y: self.size.height * 0.14)
        lblBetPlus.zPosition = 2
        lblBetPlus.text = "+"
        lblBetPlus.fontSize = 110
        lblBetPlus.fontColor = SKColor.black
        self.addChild(lblBetPlus)
        
        let balloon = SKSpriteNode(imageNamed: "1265px-Speech_balloon.svg")
        balloon.setScale(0.18)
        balloon.zPosition = 1
        balloon.position = CGPoint(x: self.size.width * 0.42, y: self.size.height * 0.30)
        self.addChild(balloon)
        
        let lblToadSpeak = SKLabelNode(fontNamed: "SystemBold")
        lblToadSpeak.position = CGPoint(x: self.size.width * 0.42, y: self.size.height * 0.3)
        lblToadSpeak.zPosition = 2
        lblToadSpeak.text = "Try again!"
        lblToadSpeak.fontSize = 32
        lblToadSpeak.fontColor = SKColor.black
        self.addChild(lblToadSpeak)
        
        let pow = SKSpriteNode(imageNamed: "POW_Block_-_New_Super_Mario_Bros_Wii")
        pow.setScale(0.065)
        pow.zPosition = 1
        pow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.18)
        self.addChild(pow)
        
        let resetUp = SKSpriteNode(imageNamed: "1up")
        resetUp.setScale(0.06)
        resetUp.zPosition = 1
        resetUp.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.06)
        self.addChild(resetUp)
        
        print(self.size.width)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
