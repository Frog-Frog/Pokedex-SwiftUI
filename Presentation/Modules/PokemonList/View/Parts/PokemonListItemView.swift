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
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 40)
                .padding(.leading, 36)
                .padding([.top, .bottom], 4)
                .padding(.trailing, -64.0)
                .frame(height: 80)
                .foregroundColor(.white)
                .shadow(color: Color(Asset.shadow.color), radius: 16, x: 0, y: 4)
            HStack(alignment: .top, spacing: 24.0) {
                LoadableImage(
                    url: self.pokemon.imageUrl,
                    placeholder: MonsterballImage(CGSize(width: 48, height: 48))
                )
                .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 8) {
                    Text("No.\(self.pokemon.number)")
                        .font(.system(size: 11, weight: .semibold))
                    Text(self.pokemon.name)
                        .font(.system(size: 17, weight: .bold))
                }
            }
            .padding(.leading, 68.0)
        }
    }
}

#if DEBUG
@testable import Domain

public struct PokemonListItemView_Previews: PreviewProvider {

    public static var previews: some View {
        let ivysaur = PokemonListModel.Pokemon(
            name: "ivysaur",
            number: 2,
            imageUrl: PokemonImageURLGenerator.generateThumbnailURL(from: 2)
        )

        return PokemonListItemView(pokemon: ivysaur)
    }
}
#endif
