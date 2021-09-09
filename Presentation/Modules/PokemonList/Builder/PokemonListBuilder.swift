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

    public static func build() -> UIViewController {
        let viewModel = PokemonListViewModelImpl()
        let wireframe = PokemonListWireframeImpl()

        viewModel.pokemonListUseCase = PokemonListUseCaseProvider.provide()
        viewModel.wireframe = PokemonListWireframeImpl()

        let view = PokemonListView(viewModel: viewModel)

        let viewController = UIHostingController(rootView: view)

        wireframe.viewController = viewController

        return viewController
    }
}
