//
//  PokemonListView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Domain
import SwiftUI

struct PokemonListView<ViewModel: PokemonListViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                List(self.viewModel.pokemons) { pokemon in
                    PokemonListItemView(pokemon: pokemon)
                        .listRowInsets(EdgeInsets())
                        .listStyle(PlainListStyle())
                }
                .background(Color(Asset.background.color))
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
