//
//  PokemonDetailModel+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain

extension PokemonDetailModel.Information.`Type`: Identifiable {

    public var id: Int {
        switch self {
        case .pokemonTypes:
            return 0
        case .height:
            return 1
        case .weight:
            return 2
        case .firstAbility:
            return 3
        case .secondAbility:
            return 4
        case .hiddenAbblity:
            return 5
        }
    }
}
