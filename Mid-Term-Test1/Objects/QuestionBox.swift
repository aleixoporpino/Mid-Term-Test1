import SpriteKit
import GameplayKit

class QuestionBox : GameObject {
    
    init() {
        super.init(imageString: "Question_Block_Art_-_New_Super_Mario_Bros", initialScale: 0.03)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
