//
//  PokemonDetailBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import SwiftUI

enum PokemonDetailBuilder {

    static func build(number: Int) -> some View {
        let viewModel = PokemonDetailViewModelImpl(number: number)
        viewModel.pokemonDetailUseCase = PokemonDetailUseCaseProvider.provide()

        let view = PokemonDetailView(viewModel: viewModel)

        return view
    }
}
