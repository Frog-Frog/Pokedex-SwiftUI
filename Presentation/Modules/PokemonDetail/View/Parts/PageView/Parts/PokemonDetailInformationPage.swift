//
//  PokemonDetailInformationPage.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI

struct PokemonDetailInformationPage: View {

    let information: PokemonDetailModel.Information

    var body: some View {
        VStack(alignment: .trailing, spacing: 8.0) {
            ForEach(self.information.types) {
                PokemonDetailInformationRow(type: $0)
            }
            .padding(.leading, 16.0)
        }
    }
}

#if DEBUG
@testable import Domain

struct PokemonDetailInformationPage_Previews: PreviewProvider {

    static var previews: some View {
        let types: [PokemonDetailModel.Information.`Type`] = [
            .pokemonTypes([.fire]),
            .height(100),
            .weight(100),
            .firstAbility("Overgrow"),
            .secondAbility(nil),
            .hiddenAbblity("Chlorophyll")
        ]
        let information = PokemonDetailModel.Information(types: types)
        PokemonDetailInformationPage(information: information)
            .background(Color(uiColor: Asset.background.color))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/375.0/*@END_MENU_TOKEN@*/, height: 328))
    }
}
#endif
