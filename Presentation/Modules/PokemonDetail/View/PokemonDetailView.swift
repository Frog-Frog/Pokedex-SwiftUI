//
//  PokemonDetailView.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 19/09/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import SwiftUI

struct PokemonDetailView<ViewModel: PokemonDetailViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        EmptyView()
    }
}

#if DEBUG
struct PokemonDetailView_Previews: PreviewProvider {

    static var previews: some View {
        PokemonDetailBuilder.build()
    }
}
#endif

