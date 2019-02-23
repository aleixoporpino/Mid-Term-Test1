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
    
    // Utility Variables
    var jackpot = 5000
    var winnings = 0
    var turn = 0
    var winNumber = 0
    var lossNumber = 0
    var winRatio = Double(0)
    var itemsOut = false
    var isToad = true
    
    // Variable for result outcomes
    var boo = 0
    var mushroom = 0
    var flower = 0
    var leaf = 0
    var cherries = 0
    var coin = 0
    var star = 0
    var bowser = 0
    var betLine = ["slot03", "slot03", "slot03"]
    var maximumBet = 100
    var currentBet = 10
    var powEnabled = true
    
    
    let lblPlayerStats = SKLabelNode(fontNamed: "SystemBold")
    let lblCoins = SKLabelNode(fontNamed: "SystemBold")
    let lblJackpot = SKLabelNode(fontNamed: "SystemBold")
    
    let objBlock1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    let objBlock2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    let objBlock3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    
    let objResult1 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    let objResult2 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    let objResult3 = SKSpriteNode(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
    
    let objEmptyBlock1 = SKSpriteNode(imageNamed: "Used")
    let objEmptyBlock2 = SKSpriteNode(imageNamed: "Used")
    let objEmptyBlock3 = SKSpriteNode(imageNamed: "Used")
    
    let lblBet = SKLabelNode(fontNamed: "SystemBold")
    
    let lblBetMinus = SKLabelNode(fontNamed: "SystemBold")
    let lblBetPlus = SKLabelNode(fontNamed: "SystemBold")
    let lblToadSpeak = SKLabelNode(fontNamed: "SystemBold")
    
    let pow = SKSpriteNode(imageNamed: "POW_Block_-_New_Super_Mario_Bros_Wii")
    
    let resetUp = SKSpriteNode(imageNamed: "1up")
    
    override func didMove(to view: SKView) {
        if Model.instance.isFirstTime(){
            Model.instance.updateCoins(label: lblCoins, coins: 1000)
        } else {
            lblCoins.text = "x\(Model.instance.getLatestCoins())"
        }
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.zPosition = 0
        background.size = self.size
        self.addChild(background)
        
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.85)
        logo.setScale(0.45)
        logo.zPosition = 1
        self.addChild(logo)
        
        lblPlayerStats.position = CGPoint(x: self.size.width * 0.6, y: self.size.height * 0.75)
        lblPlayerStats.zPosition = 1
        lblPlayerStats.text = "W:0L:0WR:0.0%T:0"
        lblPlayerStats.fontSize = 35
        lblPlayerStats.fontColor = SKColor.white
        self.addChild(lblPlayerStats)
        
        lblCoins.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.69)
        lblCoins.zPosition = 1
        lblCoins.text = "x1000"
        lblCoins.fontSize = 35
        lblCoins.fontColor = SKColor.white
        self.addChild(lblCoins)
        
        let objCoin = SKSpriteNode(imageNamed: "Coin_-_New_Super_Mario_Bros")
        objCoin.position = CGPoint(x: self.size.width * 0.15, y: self.size.height * 0.70)
        objCoin.setScale(0.03)
        objCoin.zPosition = 1
        self.addChild(objCoin)
        
        lblJackpot.position = CGPoint(x: self.size.width * 0.7, y: self.size.height * 0.69)
        lblJackpot.zPosition = 1
        lblJackpot.text = "Jackpot: 5000"
        lblJackpot.fontSize = 35
        lblJackpot.fontColor = SKColor.white
        self.addChild(lblJackpot)
        
        objBlock1.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.45)
        objBlock1.zPosition = 2
        objBlock1.setScale(0.12)
        self.addChild(objBlock1)
        
        objBlock2.setScale(0.12)
        objBlock2.zPosition = 2
        objBlock2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.45)
        self.addChild(objBlock2)
        
        objBlock3.setScale(0.12)
        objBlock3.zPosition = 2
        objBlock3.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.45)
        self.addChild(objBlock3)
        
        objResult1.position = CGPoint(x: objBlock1.position.x, y: objBlock1.position.y)
        objResult1.zPosition = 1
        objResult1.setScale(0.12)
        self.addChild(objResult1)
        
        objResult2.setScale(0.12)
        objResult2.zPosition = 1
        objResult2.position = CGPoint(x: objBlock2.position.x, y: objBlock2.position.y)
        self.addChild(objResult2)
        
        objResult3.setScale(0.12)
        objResult3.zPosition = 1
        objResult3.position = CGPoint(x: objBlock3.position.x, y: objBlock3.position.y)
        self.addChild(objResult3)
        
        let toad = SKSpriteNode(imageNamed: "toad")
        toad.setScale(0.12)
        toad.zPosition = 1
        toad.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.2)
        self.addChild(toad)
        
        lblBet.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        lblBet.zPosition = 2
        lblBet.text = "Bet x10"
        lblBet.name = "bet"
        lblBet.fontSize = 50
        lblBet.fontColor = SKColor.black
        self.addChild(lblBet)
        
        lblBetMinus.position = CGPoint(x: self.size.width * 0.43, y: self.size.height * 0.13)
        lblBetMinus.zPosition = 2
        lblBetMinus.text = "-"
        lblBetMinus.name = "betMinus"
        lblBetMinus.fontSize = 140
        lblBetMinus.fontColor = SKColor.black
        self.addChild(lblBetMinus)
        
        lblBetPlus.position = CGPoint(x: self.size.width * 0.55, y: self.size.height * 0.14)
        lblBetPlus.zPosition = 2
        lblBetPlus.text = "+"
        lblBetPlus.name = "betPlus"
        lblBetPlus.fontSize = 110
        lblBetPlus.fontColor = SKColor.black
        self.addChild(lblBetPlus)
        
        let balloon = SKSpriteNode(imageNamed: "1265px-Speech_balloon.svg")
        balloon.setScale(0.2)
        balloon.size.width = 300
        balloon.zPosition = 1
        balloon.position = CGPoint(x: self.size.width * 0.42, y: self.size.height * 0.30)
        self.addChild(balloon)
        
        lblToadSpeak.position = CGPoint(x: self.size.width * 0.42, y: self.size.height * 0.3)
        lblToadSpeak.zPosition = 2
        lblToadSpeak.text = "Welcome"
        lblToadSpeak.fontSize = 32
        lblToadSpeak.fontColor = SKColor.black
        self.addChild(lblToadSpeak)
        
        pow.setScale(0.065)
        pow.zPosition = 1
        pow.name = "pow"
        pow.position = CGPoint(x: self.size.width * 0.8, y: self.size.height * 0.18)
        self.addChild(pow)
        
        resetUp.setScale(0.06)
        resetUp.zPosition = 1
        resetUp.name = "reset"
        resetUp.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.06)
        self.addChild(resetUp)
        
        startSlothMachine()
    }
    
    func startSlothMachine() {
        if Model.instance.isFirstTime(){
            Model.instance.updateCoins(label: lblCoins, coins: 1000)
        } else {
            lblCoins.text = "x\(Model.instance.getLatestCoins())"
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    // Return current coins and remove the 'x' string
    var currentCoins : Int {
        guard let coins = lblCoins.text, !(lblCoins.text?.isEmpty)! else {
            return 0
        }
        return Int(coins.replacingOccurrences(of: "x", with: ""))!
    }
    
    // Bet coins
    var betCoins : Int = 10 {
        didSet {
            lblBet.text = "Bet x\(currentCoins)"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "reset" {
                reset()
            } else if tappedNode.name == "pow" && powEnabled {
                spin()
            } else if tappedNode.name == "betPlus" {
                if currentCoins < maximumBet {
                    maximumBet = currentCoins
                }
                var amount = currentBet + 10
                if amount > maximumBet {
                    amount = maximumBet
                }
                if currentCoins >= amount {
                    betCoins = amount
                    lblBet.text = "Bet x\(amount)"
                    currentBet = amount
                }
            } else if tappedNode.name == "betMinus" {
                let amount = currentBet - 10
                if amount > 0 {
                    if currentCoins >= amount {
                        betCoins = amount
                        lblBet.text = "Bet x\(amount)"
                        currentBet = amount
                    }
                }
            }
            
        }
        
    }
    
    func spin() {
        
        if itemsOut {
            objResult1.position.y -= objBlock2.size.height + 20
            objResult2.position.y -= objBlock2.size.height + 20
            objResult3.position.y -= objBlock2.size.height + 20
        }
        
        Reels()
        
        turn = turn + 1
        itemsOut = true
        objBlock1.texture = SKTexture(imageNamed: "Used")
        objBlock2.texture = SKTexture(imageNamed: "Used")
        objBlock3.texture = SKTexture(imageNamed: "Used")
        objResult1.texture = SKTexture(imageNamed: betLine[0])
        objResult2.texture = SKTexture(imageNamed: betLine[1])
        objResult3.texture = SKTexture(imageNamed: betLine[2])
        
        let moveItemsOutOfTheBlock = SKAction.moveTo(y: objBlock1.position.y + objBlock1.size.height + 20, duration: 1)
        
        let disablePow = SKAction.run {
            self.pow.alpha = 0.2
            self.powEnabled = false
        }
        let enablePow = SKAction.run {
            self.pow.alpha = 1
            self.powEnabled = true
        }
        
        let startGameSequence = SKAction.sequence([disablePow, moveItemsOutOfTheBlock, enablePow])
        
        objResult1.run(startGameSequence)
        objResult2.run(startGameSequence)
        objResult3.run(startGameSequence)
        
        let initialSound = SKAction.run {
            Model.instance.playSound(sound: Constant.smw_vine)
        }
        
        let initialMove = SKAction.moveTo(x: self.pow.position.x, duration: 1)
        
        let finishMove = SKAction.run {
            self.determineWinnings()
            self.updatePlayerStatus()
        }
        
        let finishGameSequence = SKAction.sequence([initialSound,initialMove, finishMove])
        
        pow.run(finishGameSequence)
        
    }
    
    /* When this function is called it determines the betLine results. */
    func Reels() {
        
        var outCome = [0, 0, 0]
        
        for spin in 0...2 {
            //outCome[spin] = Math.floor((Math.random() * 65) + 1)
            outCome[spin] = Int(arc4random_uniform(UInt32(8 * 8))) + 3
            switch (outCome[spin]) {
            case checkRange(value: spin, lowerBounds: 1, upperBounds: 27):
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):
                betLine[spin] = "slot08"
                bowser = bowser + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):
                betLine[spin] = "slot07"
                boo = boo + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46):
                betLine[spin] = "slot03"
                mushroom = mushroom + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54):
                betLine[spin] = "slot04"
                flower = flower + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59):
                betLine[spin] = "slot02"
                leaf = leaf + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62):
                betLine[spin] = "slot05"
                cherries = cherries + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64):
                betLine[spin] = "slot01"
                coin = coin + 1
                break
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65):
                betLine[spin] = "slot06"
                star = star + 1
                break
            default:
                break
            }
        }
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int {
        if (value >= lowerBounds && value <= upperBounds) {
            return value
        }
        else {
            return 0
        }
    }
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings() {
        if (bowser == 0) {
            if (boo == 3) {
                winnings = betCoins * 10
            }
            else if(mushroom == 3) {
                winnings = betCoins * 20
            }
            else if (flower == 3) {
                winnings = betCoins * 30
            }
            else if (leaf == 3) {
                winnings = betCoins * 40
            }
            else if (cherries == 3) {
                winnings = betCoins * 50
            }
            else if (coin == 3) {
                winnings = betCoins * 75
            }
            else if (star == 3) {
                winnings = betCoins * 100
            }
            else if (boo == 2) {
                winnings = betCoins * 2
            }
            else if (mushroom == 2) {
                winnings = betCoins * 2
            }
            else if (flower == 2) {
                winnings = betCoins * 3
            }
            else if (leaf == 2) {
                winnings = betCoins * 4
            }
            else if (cherries == 2) {
                winnings = betCoins * 5
            }
            else if (coin == 2) {
                winnings = betCoins * 10
            }
            else if (star == 2) {
                winnings = betCoins * 20
            }
            else if (star == 1) {
                winnings = betCoins * 5
            }
            else {
                winnings = betCoins * 1
            }
            
            winNumber = winNumber + 1
            Model.instance.playSound(sound: Constant.smw_1up)
            showWinMessage()
            
        } else {
            lossNumber = lossNumber + 1
            Model.instance.playSound(sound: Constant.smw_spring_jump)
            showLossMessage()
        }
        
    }
    
    /* Utility function to show a win message and increase player money */
    func showWinMessage() {
        Model.instance.updateCoins(label: lblCoins, coins: (currentCoins + winnings))
        lblToadSpeak.text = "YOU WON $\(winnings)"
        resetResultOutcomes()
        checkJackPot()
    }
    
    /* Utility function to show a loss message and reduce player money */
    func showLossMessage() {
        Model.instance.updateCoins(label: lblCoins, coins: (currentCoins - betCoins))
        lblToadSpeak.text  = "TRY AGAIN"
        resetResultOutcomes()
    }
    
    func updatePlayerStatus() {
        if turn > 0 {
            winRatio = (Double(winNumber) / Double(turn))
        }
        lblPlayerStats.text = "W:\(winNumber) L:\(lossNumber) WR:\(round((winRatio * 100)))% T:\(turn)"
    }
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        let jackPotTry = Int(arc4random_uniform(UInt32(51))) + 1
        let jackPotWin = Int(arc4random_uniform(UInt32(51))) + 1
        //let jackPotTry = 1
        //let jackPotWin = 1
        if (jackPotTry == jackPotWin) {
            Model.instance.playSound(sound: Constant.star_theme)
            lblToadSpeak.text = "$\(self.jackpot) JACKPOT!!"
            Model.instance.updateCoins(label: self.lblCoins, coins: (self.currentCoins + self.jackpot))
            self.jackpot = 1000
            self.lblJackpot.text = "Jackpot: \(self.jackpot)"
        }
        
    }
    
    // Show Game Over alert and restart the game
    func gameOver(){
        Model.instance.playSound(sound: Constant.smw_game_over)
        let alert = UIAlertController(title: "Game Over", message: "You are out of coins! \nPlay Again?", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.startSlothMachine()
        }))
        //present(alert, animated: true, completion: nil)
        self.resetResultOutcomes()
        self.resetPlayerStats()
    }
    
    func reset() {
        Model.instance.playSound(sound: Constant.smw_bonus_game_end)
        Model.instance.playSound(sound: Constant.overworld)
        
        if self.itemsOut {
            objResult1.position.y -= objBlock2.size.height + 20
            objResult2.position.y -= objBlock2.size.height + 20
            objResult3.position.y -= objBlock2.size.height + 20
            self.itemsOut = false
        }
        
        objBlock1.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        objBlock2.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        objBlock3.texture = SKTexture(imageNamed: "Question_Block_Art_-_New_Super_Mario_Bros")
        lblToadSpeak.text = "GOOD LUCK!"
        
        Model.instance.deletePreviousSave()
        self.startSlothMachine()
        self.resetResultOutcomes()
        self.resetPlayerStats()
        currentBet = 10
        lblBet.text = "Bet x\(currentBet)"
    }
    
    /* Utility function to reset all the previous result outcomes */
    func resetResultOutcomes() {
        boo = 0
        mushroom = 0
        flower = 0
        leaf = 0
        cherries = 0
        coin = 0
        star = 0
        bowser = 0
    }
    
    /* Utility function to reset the player stats */
    func resetPlayerStats() {
        jackpot = 5000
        lblJackpot.text = "Jackpot: \(jackpot)"
        winnings = 0
        turn = 0
        winNumber = 0
        lossNumber = 0
        winRatio = 0
        updatePlayerStatus()
    }
}
