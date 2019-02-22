//
//  Model.swift
//  SlothMachine
//
//  Created by Thayllan Anacleto (300973606), José Aleixo (301005491) and Rodrigo Silva (300993648) on 2019-01-17.
//  Copyright © 2019 Sloth Machine. All rights reserved.
//

// Class used as Model for the Slot Machine

import UIKit
import AVFoundation
class Model {
    
    fileprivate static let modelInstance = Model()
    
    fileprivate init() {}
    
    static var instance : Model {
        get {
            return modelInstance
        }
    }
    
    var soundPlayer : AVAudioPlayer?
    
    // Get previous amount of coins
    func getLatestCoins() -> Int {
        let coins = UserDefaults.standard.integer(forKey: Constant.player_coins)
        return coins <= 0 ? 500 : coins
    }
    
    // Function used to update the player's coins
    func updateCoins(label : UILabel, coins amount : Int) {
        label.text = "x\(Int(amount))"
        UserDefaults.standard.set(amount, forKey: Constant.player_coins)
    }
    
    // Function used to update the player's first time flag
    func deletePreviousSave() {
        UserDefaults.standard.set(false, forKey: Constant.previous_save)
    }
    
    // Check if it's the user's first play
    func isFirstTime() -> Bool {
        
        let previousSave = UserDefaults.standard.bool(forKey: Constant.previous_save)
        
        if !previousSave{
            UserDefaults.standard.set(true, forKey: Constant.previous_save)
            return true
        }
        
        return false
        
    }
    
    // Play sound
    func playSound(sound name : String) {
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        
        soundPlayer = try? AVAudioPlayer(contentsOf: url)
        soundPlayer?.play()
        
    }
    
}

