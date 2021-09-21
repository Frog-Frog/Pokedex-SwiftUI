//
//  PokemonDetailViewModel.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 19/09/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import SwiftUI

protocol PokemonDetailViewModel: ObservableObject {

    var model: PokemonDetailModel! { get }

    var fetchError: Error! { get }

    func onAppear()
}

final class PokemonDetailViewModelImpl: PokemonDetailViewModel {

    let number: Int

    var pokemonDetailUseCase: PokemonDetailUseCase!

    @Published var model: PokemonDetailModel!

    @Published var fetchError: Error!

    init(number: Int) {
        self.number = number
    }

    func onAppear() {
        self.pokemonDetailUseCase.get(number: self.number) {
            do {
                self.model = try $0.get()
            } catch {
                self.fetchError = error
            }
        }
    }
}
