//
//  PokemonListView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

protocol PokemonListViewInterface {
    mutating func showPokemonListModel(_ model: PokemonListModel)
}

struct PokemonListView: View {
    
    private var pokemons = [PokemonListModel.Pokemon]()
    
    var body: some View {
        List(self.pokemons) { pokemon in
            Text(pokemon.name)
        }
    }
}

extension PokemonListView: PokemonListViewInterface {
    
    mutating func showPokemonListModel(_ model: PokemonListModel) {
        self.pokemons = model.pokemons
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

extension PokemonListModel.Pokemon: Identifiable {
    
    public var id: Int {
        return self.number
    }
}
