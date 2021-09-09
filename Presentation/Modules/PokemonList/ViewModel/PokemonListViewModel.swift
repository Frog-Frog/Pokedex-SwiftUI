//
//  PokemonListViewModel.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import Foundation
import SwiftUI

protocol PokemonListViewModel: ObservableObject {

    var pokemons: [PokemonListModel.Pokemon] { get }

    func onAppear()

    func didSelect(_ pokemon: PokemonListModel.Pokemon)
}

final class PokemonListViewModelImpl: PokemonListViewModel {

    @Published var pokemons = [PokemonListModel.Pokemon]()

    var wireframe: PokemonListWireframe!
    var pokemonListUseCase: PokemonListUseCase!

    func onAppear() {
        self.pokemonListUseCase.get { result in
            switch result {
            case .success(let model):
                self.pokemons = model.pokemons
            case .failure:
                break
            }
        }
    }

    func didSelect(_ pokemon: PokemonListModel.Pokemon) {
        // TODO
    }
}
