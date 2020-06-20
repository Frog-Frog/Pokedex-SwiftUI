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
        let viewModel = PokemonListViewModel()
        viewModel.pokemonListUseCase = PokemonListUseCaseProvider.provide()

        let view = PokemonListView(viewModel: viewModel)

        return view
    }
}
