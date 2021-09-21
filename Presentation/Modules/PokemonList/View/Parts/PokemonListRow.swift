//
//  PokemonListItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

struct PokemonListRow: View {

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
                        .foregroundColor(Color(Asset.primaryBlack.color))
                    Text(self.pokemon.name)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color(Asset.primaryBlack.color))
                }
            }
            .padding(.leading, 68.0)
        }
    }
}

#if DEBUG
@testable import Domain

public struct PokemonListRow_Previews: PreviewProvider {

    public static var previews: some View {
        let ivysaur = PokemonListModel.Pokemon(
            name: "Ivysaur",
            number: 2,
            imageUrl: PokemonImageURLGenerator.generateThumbnailURL(from: 2)
        )

        return PokemonListRow(pokemon: ivysaur)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/375.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/))
    }
}
#endif
