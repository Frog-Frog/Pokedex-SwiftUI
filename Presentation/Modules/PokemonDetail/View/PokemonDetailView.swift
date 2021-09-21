//
//  PokemonDetailView.swift
//  Pokedex-SwiftUI
//
//  Created by Tomosuke Okada on 19/09/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import SwiftUI
import SwiftUIX

struct PokemonDetailView<ViewModel: PokemonDetailViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .top) {
            if self.viewModel.model != nil {
                Image(image: Asset.backgroundPokemonType.image)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(.init(width: 375, height: 240), contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(hex: self.viewModel.model.typeHex))
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        PopButton()
                        Spacer()
                    }
                    .padding(.leading, 24.0)
                    VStack(spacing: 8) {
                        LoadableImage(
                            url: self.viewModel.model.imageUrl,
                            placeholder: MonsterballImage(.init(width: 150, height: 150))
                        )
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.horizontal, 48.0)
                        VStack(alignment: .leading, spacing: 24) {
                            PokemonDetailNameView(
                                number: self.viewModel.model.number,
                                name: self.viewModel.model.name
                            )
                            .padding(.leading, 16.0)
                            PokemonDetailPageView(
                                information: self.viewModel.model.information,
                                stats: self.viewModel.model.stats
                            )
                        }
                    }
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(Color(Asset.background.color))
        .onAppear {
            self.viewModel.onAppear()
        }
    }
}

#if DEBUG
struct PokemonDetailView_Previews: PreviewProvider {

    static var previews: some View {
        PokemonDetailBuilder.build(number: 1)
    }
}
#endif
