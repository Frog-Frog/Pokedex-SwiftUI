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
        CocoaList(self.viewModel.pokemons) { pokemon in
            PokemonListItemView(pokemon: pokemon)
                .onTapGesture {
                    self.viewModel.didSelect(pokemon)
                }
        }
        .listSeparatorStyle(.none)
        .background(Color(Asset.background.color))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitleView(
            Image(uiImage: Asset.logo.image)
                .resizable()
                .scaledToFit()
                .frame(width: nil, height: 44, alignment: .center),
            displayMode: .inline
        )
        .onAppear {
            self.viewModel.onAppear()
        }
    }
}

#if DEBUG
struct PokemonListView_Previews: PreviewProvider {

    struct Representer: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            return UINavigationController(rootViewController: PokemonListBuilder.build())
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            uiViewController.viewDidLoad()
        }
    }

    static var previews: some View {
        return Representer()
    }
}
#endif
