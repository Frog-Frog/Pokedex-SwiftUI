//
//  PokemonDetailNameView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/20.
//

import Domain
import SwiftUI

struct PokemonDetailNameView: View {

    let number: Int

    let name: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No.\(self.number)")
                .font(.system(size: 16, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(Color(Asset.primaryBlack.color))
                .frame(height: 16)
            Text(self.name)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color(Asset.primaryBlack.color))
                .frame(height: 32)
        }
    }
}

struct PokemonDetailNameView_Previews: PreviewProvider {

    static var previews: some View {
        PokemonDetailNameView(number: 2, name: "Ivysaur")
            .previewLayout(.fixed(width: 200, height: 56))
    }
}
