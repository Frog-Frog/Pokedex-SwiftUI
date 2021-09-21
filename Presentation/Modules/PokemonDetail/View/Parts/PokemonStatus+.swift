//
//  PokemonStatus+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain

extension PokemonStatus: Identifiable {

    public var id: Int {
        return self.type.priority
    }
}
