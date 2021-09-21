//
//  PokemonDetailBuilder.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 19/09/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
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
