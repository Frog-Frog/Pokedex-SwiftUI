//
//  PokemonDetailView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/07/05.
//

import SwiftUI

struct PokemonDetailView<ViewModel: PokemonDetailViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 24) {
                VStack(spacing: 94) {
                    self.typeColorView
                    self.subjectView
                }
                self.profileScrollView
            }
            self.pokemonImageView
        }.onAppear {
            self.viewModel.onAppear()
        }
    }

    private var pokemonImageView: some View {
        Group {
            if self.viewModel.model != nil {
                LoadableImage(url: self.viewModel.model!.imageUrl, placeholder: Image(uiImage: Asset.monsterball.image))
            } else {
                Image(uiImage: Asset.monsterball.image)
            }
        }
    }

    private var typeColorView: some View {
        Group {
            if self.viewModel.model != nil {
                Image(uiImage: Asset.backgroundPokemonType.image)
                    .renderingMode(.template)
                    .foregroundColor(Color(hex: self.viewModel.model!.typeHex))
            } else {
                Image(uiImage: Asset.backgroundPokemonType.image)
                    .renderingMode(.template)
                    .foregroundColor(.clear)
            }
        }
    }

    private var subjectView: some View {
        Group {
            if self.viewModel.model != nil {
                PokemonDetailSubjectView(name: self.viewModel.model!.name, number: self.viewModel.model!.number)
            } else {
                EmptyView()
            }
        }
    }

    private var profileScrollView: some View {
        Group {
            if self.viewModel.model != nil {
                HorizontalPagingScrollView(contentViews: [EmptyView()])
                    .frame(height: 336, alignment: .center)
            } else {
                EmptyView()
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailBuilder.build(number: 1)
    }
}
