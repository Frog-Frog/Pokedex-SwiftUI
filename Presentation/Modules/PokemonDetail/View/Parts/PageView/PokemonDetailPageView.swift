//
//  PokemonDetailPageView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI
import SwiftUIX

struct PokemonDetailPageView: View {

    let information: PokemonDetailModel.Information

    let stats: [PokemonStatus]

    var body: some View {
        GeometryReader { geometry in
            CocoaScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0.0) {
                    PokemonDetailInformationPage(information: self.information)
                    PokemonDetailStatusPage(stats: self.stats)
                }
                .frame(width: geometry.size.width * 2)
            }
            .isPagingEnabled(true)
        }
    }
}

#if DEBUG
@testable import Domain

struct PokemonDetailPageView_Previews: PreviewProvider {
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

        let stats: [PokemonStatus] = [
            .init(name: "hp", value: 100)!,
            .init(name: "attack", value: 100)!,
            .init(name: "defense", value: 100)!,
            .init(name: "special-attack", value: 100)!,
            .init(name: "special-defense", value: 100)!,
            .init(name: "speed", value: 100)!
        ]

        PokemonDetailPageView(
            information: information,
            stats: stats
        )
        .background(Color(Asset.background.color))
        .previewLayout(.fixed(width: 375, height: 328))
    }
}
#endif
