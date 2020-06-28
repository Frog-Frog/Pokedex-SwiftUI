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
                }
                .background(Color(Asset.background.color))
                .navigationBarTitle(Text(""), displayMode: .inline)
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
                .onDisappear {
                    UITableView.appearance().separatorStyle = .singleLine
                }
            }
            .shadow(color: Color(Asset.background.color), radius: 16, x: 0, y: 4)
            .onAppear {
                UINavigationBar.appearance().shadowImage = UIImage()
            }
            Image(uiImage: Asset.logo.image)
                .resizable()
                .scaledToFit()
                .frame(width: nil, height: 44, alignment: .center)
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
