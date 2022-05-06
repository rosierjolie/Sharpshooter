//
//  GameViewController.swift
//  Sharpshooter
//
//  Created by Jerry Turcios on 1/24/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import GoogleMobileAds
import SpriteKit
import UIKit

class GameViewController: UIViewController {
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configures the banner ad from Google AdMob
        configureBannerView()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill

                // Present the scene
                view.presentScene(scene)
            }

            view.ignoresSiblingOrder = true

            #if DEBUG
            view.showsFPS = true
            view.showsNodeCount = true
            #else
            view.showsFPS = false
            view.showsNodeCount = false
            #endif
        }
    }

    private func configureBannerView() {
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        #if DEBUG
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        #else
        bannerView.adUnitID = "ca-app-pub-7650921031103818/4452454902"
        #endif

        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
