//
//  Utils.swift
//  SlothMachine
//
//  Created by Thayllan Anacleto (300973606), José Aleixo (301005491) and Rodrigo Silva (300993648) on 2019-01-17.
//  Copyright © 2019 Sloth Machine. All rights reserved.
//

// Supporting Class

import UIKit

struct Constant {
    
    static let player_coins : String = "coins"
    static let previous_save : String = "save_exist"
    static let overworld : String = "overworld"
    static let smw_vine : String = "smw_vine"
    static let smw_1up : String = "smw_1up"
    static let smw_spring_jump : String = "smw_spring_jump"
    static let smw_game_over : String = "smw_game_over"
    static let star_theme : String = "star_theme"
    static let smw_bonus_game_end : String = "smw_bonus_game_end"
    
}

extension UIViewController {
    
    // Function to set the animation images and time
    func animate(view : UIImageView, images : [UIImage] , duration : TimeInterval , repeatCount : Int) {
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
    
}

extension UIImage{
    
    // Function used to make the wheel spin
    func spriteSheet(cols : UInt, rows : UInt) -> [UIImage]{
        
        let w = self.size.width / CGFloat(cols)
        let h = self.size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        var arr : [UIImage] = []
        
        for _ in 0..<rows{
            for _ in 0..<cols{
                
                // Crop
                let subImage = self.crop(rect)
                // Add to array
                arr.append(subImage)
                
                // Go to next image in row
                rect.origin.x += w
            }
            
            // Next row
            rect.origin.x = 0
            rect.origin.y += h
        }
        
        return arr
        
    }
    
    func crop(_ rect : CGRect) -> UIImage{
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return UIImage()
        }
        return UIImage(cgImage: imageRef)
    }
    
}
