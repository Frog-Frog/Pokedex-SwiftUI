//
//  PokemonListView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI
import SwiftUIX

struct PokemonListView<ViewModel: PokemonListViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 4.0) {
                    ForEach(self.viewModel.pokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailBuilder.build(number: pokemon.number)) {
                            PokemonListRow(pokemon: pokemon)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Pokedex")
            .onAppear {
                self.viewModel.onAppear()
            }
        }.navigationViewStyle(.stack)
    }
}

#if DEBUG
struct PokemonListView_Previews: PreviewProvider {

    static var previews: some View {
        return PokemonListBuilder.build()
            .previewDevice("iPhone 13 Pro")
    }
}
#endif
