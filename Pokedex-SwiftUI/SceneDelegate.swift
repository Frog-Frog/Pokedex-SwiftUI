//
//  SceneDelegate.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 2020/06/20.
//  Copyright © 2020 TomosukeOkada. All rights reserved.
//

import UIKit
import SwiftUI
import Presentation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: PokemonListBuilder.build())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
