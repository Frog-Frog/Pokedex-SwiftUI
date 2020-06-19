//
//  PokemonListBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import SwiftUI

public enum PokemonListBuilder {

    public static func build() -> some View {
        let view = PokemonListView()
        let presenter = PokemonListPresenterImpl()
        let wireframe = PokemonListWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe
        presenter.pokemonListUseCase = PokemonListUseCaseProvider.provide()

        wireframe.viewController = view

        return view
    }
}
