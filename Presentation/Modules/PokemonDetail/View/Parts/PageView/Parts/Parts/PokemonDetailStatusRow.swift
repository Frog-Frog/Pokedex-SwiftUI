//
//  PokemonDetailStatusRow.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI

struct PokemonDetailStatusRow: View {

    let status: PokemonStatus

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius([.topTrailing, .bottomTrailing], 40)
            HStack(alignment: .center) {
                HStack(spacing: 26.0) {
                    Image(image: self.status.type.iconImage)
                    Text(self.status.type.name)
                        .font(.system(size: 15, weight: .bold))
                }
                Text("\(self.status.value)")
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.leading, 40)
            .padding(.trailing, 28)
        }
        .frame(height: 48)
    }
}

private extension PokemonStatus.`Type` {

    var iconImage: UIImage {
        switch self {
        case .hp:
            return Asset.iconHitPoint.image
        case .attack:
            return Asset.iconAttack.image
        case .defense:
            return Asset.iconDefense.image
        case .specialAttack:
            return Asset.iconSpecialAttack.image
        case .specialDefense:
            return Asset.iconSpecialDefense.image
        case .speed:
            return Asset.iconSpeed.image
        }
    }

    var name: String {
        switch self {
        case .hp:
            return L10n.PokemonDetail.Status.hitpoint
        case .attack:
            return L10n.PokemonDetail.Status.attack
        case .defense:
            return L10n.PokemonDetail.Status.defense
        case .specialAttack:
            return L10n.PokemonDetail.Status.specialAttack
        case .specialDefense:
            return L10n.PokemonDetail.Status.specialDefense
        case .speed:
            return L10n.PokemonDetail.Status.speed
        }
    }
}

#if DEBUG

@testable import Domain

struct PokemonDetailStatusRow_Previews: PreviewProvider {
    static var previews: some View {
        let status = PokemonStatus(name: "attack", value: 100)!
        PokemonDetailStatusRow(status: status)
            .previewLayout(.fixed(width: 375, height: 48))
    }
}

#endif
