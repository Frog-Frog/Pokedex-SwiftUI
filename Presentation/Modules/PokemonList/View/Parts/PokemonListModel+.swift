//
//  PokemonListModel+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import Foundation

extension PokemonListModel.Pokemon: Identifiable {

    public var id: Int {
        return self.number
    }
}
