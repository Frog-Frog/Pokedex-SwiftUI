//
//  PokemonDetailInformationRow.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI

struct PokemonDetailInformationRow: View {

    let type: PokemonDetailModel.Information.`Type`

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius([.topLeading, .bottomLeading], 40)
            HStack(alignment: .center) {
                HStack(spacing: 26.0) {
                    Image(image: self.type.iconImage)
                    Text(self.type.name)
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Text(self.type.value)
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.leading, 28)
            .padding(.trailing, 40)
        }
        .frame(height: 48)
    }
}

private extension PokemonDetailModel.Information.`Type` {

    var iconImage: UIImage {
        switch self {
        case .pokemonTypes:
            return Asset.iconPokemonType.image
        case .height,
             .weight:
            return Asset.iconBody.image
        case .firstAbility,
             .secondAbility:
            return Asset.iconNormalAbility.image
        case .hiddenAbblity:
            return Asset.iconHiddenAbility.image
        }
    }

    var name: String {
        switch self {
        case .pokemonTypes:
            return L10n.PokemonDetail.Information.type
        case .height:
            return L10n.PokemonDetail.Information.height
        case .weight:
            return L10n.PokemonDetail.Information.weight
        case .firstAbility:
            return L10n.PokemonDetail.Information.firstAbility
        case .secondAbility:
            return L10n.PokemonDetail.Information.secondAbility
        case .hiddenAbblity:
            return L10n.PokemonDetail.Information.hiddenAbility
        }
    }

    var value: String {
        switch self {
        case .pokemonTypes(let types):
            return types.map { $0.text }.joined(separator: " / ")
        case .height(let mHeight):
            return L10n.PokemonDetail.Information.meter(mHeight)
        case .weight(let kgWeight):
            return L10n.PokemonDetail.Information.kilogram(kgWeight)
        case .firstAbility(let name):
            return name
        case .secondAbility(let name),
             .hiddenAbblity(let name):
            return name ?? L10n.PokemonDetail.Information.none
        }
    }
}

struct PokemonDetailInformationRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailInformationRow(type: .height(100))
            .previewLayout(.fixed(width: 375, height: 48))
    }
}
