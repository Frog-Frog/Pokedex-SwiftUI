//
//  PokemonDetailBuilder.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 19/09/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import SwiftUI

enum PokemonDetailBuilder {

    static func build() -> some View {
        let viewModel = PokemonDetailViewModelImpl()
        let view = PokemonDetailView(viewModel: viewModel)
        return view
    }
}
