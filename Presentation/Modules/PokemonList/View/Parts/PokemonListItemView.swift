//
//  PokemonListItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

struct PokemonListItemView: View {
    //
    //    private let pokemon: PokemonListModel.Pokemon
    //
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            Image(uiImage: UIImage())
                .frame(width: 48, height: 48, alignment: .center)
        }
    }
}

#if DEBUG
struct PokemonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListItemView()
    }
}
#endif
