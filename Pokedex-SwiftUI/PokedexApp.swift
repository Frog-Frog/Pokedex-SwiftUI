//
//  Pokedex_SwiftUIApp.swift
//  Shared
//
//  Created by Tomosuke Okada on 2021/09/19.
//

import SwiftUI
import Presentation

@main
struct PokedexApp: App {

    var body: some Scene {
        WindowGroup {
            PokemonListBuilder.build()
        }
    }
}
