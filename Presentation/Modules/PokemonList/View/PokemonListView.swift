//
//  PokemonListView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

struct PokemonListView: View {

    @ObservedObject var viewModel: PokemonListViewModel

    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                List(self.viewModel.pokemons) { pokemon in
                    HStack(alignment: .center, spacing: 24) {
                        LoadableImage(
                            url: pokemon.imageUrl,
                            placeholder: MonsterballImage(CGSize(width: 48, height: 48))
                        )
                            .frame(width: 48, height: 48, alignment: .center)
                        Text(pokemon.name)
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
            }
            VStack {
                Image(uiImage: Asset.logo.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 44, alignment: .center)
            }
        }.onAppear {
            self.viewModel.onAppear()
        }
    }
}

#if DEBUG
struct PokemonListView_Previews: PreviewProvider {

    static var previews: some View {
        return PokemonListBuilder.build()
    }
}
#endif
