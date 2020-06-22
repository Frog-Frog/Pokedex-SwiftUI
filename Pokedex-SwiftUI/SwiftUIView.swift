//
//  SwiftUIView.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 2020/06/22.
//

import SwiftUI
@testable import Domain
@testable import Presentation

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let ivysaur = PokemonListModel.Pokemon(
            name: "ivysaur",
            number: 2,
            imageUrl: PokemonImageURLGenerator.generateThumbnailURL(from: 2)
        )
        return PokemonListItemView(pokemon: ivysaur)
    }
}
