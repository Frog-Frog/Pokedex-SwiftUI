//
//  PokemonDetailViewModel.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/07/05.
//

import Domain
import Foundation

protocol PokemonDetailViewModel: ObservableObject {

    var model: PokemonDetailModel? { get }

    func onAppear()
}

final class PokemonDetailViewModelImpl: PokemonDetailViewModel {

    @Published var model: PokemonDetailModel?

    let number: Int

    var pokemonDetailUseCase: PokemonDetailUseCase!

    init(number: Int) {
        self.number = number
    }

    func onAppear() {
        self.pokemonDetailUseCase.get(number: self.number) { result in
            switch result {
            case .success(let model):
                self.model = model
            case .failure(let error):
                break
            }
        }
    }
}
