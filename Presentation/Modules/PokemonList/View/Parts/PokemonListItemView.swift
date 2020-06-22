//
//  PokemonListItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

struct PokemonListItemView: View {

    let pokemon: PokemonListModel.Pokemon

    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            LoadableImage(
                url: self.pokemon.imageUrl,
                placeholder: MonsterballImage(CGSize(width: 48, height: 48))
            )
                .frame(width: 48, height: 48, alignment: .center)
            VStack(alignment: .leading, spacing: 4) {
                Text("No.\(self.pokemon.number)")
                    .font(.system(size: 11, weight: .semibold))
                Text(self.pokemon.name)
                    .font(.system(size: 17, weight: .bold))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}

#if DEBUG
public struct PokemonListItemView_Previews: PreviewProvider {

    public static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
#endif
