//
//  PokemonListViewModel.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import Foundation

protocol PokemonListViewModel: ObservableObject {

    var pokemons: [PokemonListModel.Pokemon] { get }

    func onAppear()
}

final class PokemonListViewModelImpl: PokemonListViewModel {

    @Published var pokemons = [PokemonListModel.Pokemon]()

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
}
