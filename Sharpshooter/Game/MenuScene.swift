//
//  MenuScene.swift
//  Sharpshooter
//
//  Created by Jerry Turcios on 1/27/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import SpriteKit

class MenuScene: GameScene {
    var highScoreLabel: SKLabelNode!
    var startGameButton: SKSpriteNode!
    var aboutButton: SKSpriteNode!

    var highScore = 0 {
        didSet {
            highScoreLabel.text = "High Score: \(highScore)"
        }
    }

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "Background (Alt)")
        background.name = "Background"
        background.position = CGPoint(x: 512, y: 384)
        background.zPosition = -1
        addChild(background)

        let title = SKSpriteNode(imageNamed: "Game Title")
        title.name = "Title"
        title.position = CGPoint(x: 512, y: 440)
        title.size = CGSize(width: 568.7, height: 119.3)
        addChild(title)

        highScoreLabel = SKLabelNode()
        highScoreLabel.name = "HighScore"
        highScoreLabel.fontColor = .white
        highScoreLabel.fontName = "Arial Rounded MT Bold"
        highScoreLabel.position = CGPoint(x: 512, y: 720)
        highScoreLabel.zPosition = 1
        highScoreLabel.horizontalAlignmentMode = .center
        addChild(highScoreLabel)

        // Sets the high score if stored data was found
        highScore = StorageManager.loadHighScore()

        startGameButton = SKSpriteNode(imageNamed: "Start Game Button")
        startGameButton.name = "Start"
        startGameButton.position = CGPoint(x: 380, y: 300)
        startGameButton.zPosition = 1
        addChild(startGameButton)

        aboutButton = SKSpriteNode(imageNamed: "About Button")
        aboutButton.name = "About"
        aboutButton.position = CGPoint(x: 644, y: 300)
        aboutButton.zPosition = 1
        addChild(aboutButton)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)

        for node in tappedNodes {
            if node.name == "Start" {
                let reveal = SKTransition.crossFade(withDuration: 1)
                let gameScene = GameScene(size: self.size)
                view?.presentScene(gameScene, transition: reveal)
            } else if node.name == "About" {
                let reveal = SKTransition.flipHorizontal(withDuration: 1)
                let aboutScene = AboutScene(size: self.size)
                view?.presentScene(aboutScene, transition: reveal)
            }
        }
    }
}
