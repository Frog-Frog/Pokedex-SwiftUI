//
//  PokemonDetailStatusPage.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI

struct PokemonDetailStatusPage: View {

    let stats: [PokemonStatus]

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            ForEach(self.stats) {
                PokemonDetailStatusRow(status: $0)
            }
            .padding(.trailing, 16)
        }
    }
}

#if DEBUG

@testable import Domain

struct PokemonDetailStatusPage_Previews: PreviewProvider {

    static var previews: some View {
        let stats: [PokemonStatus] = [
            .init(name: "hp", value: 100)!,
            .init(name: "attack", value: 100)!,
            .init(name: "defense", value: 100)!,
            .init(name: "special-attack", value: 100)!,
            .init(name: "special-defense", value: 100)!,
            .init(name: "speed", value: 100)!
        ]

        PokemonDetailStatusPage(stats: stats)
            .background(Color(uiColor: Asset.background.color))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/375.0/*@END_MENU_TOKEN@*/, height: 328))
    }
}
#endif
