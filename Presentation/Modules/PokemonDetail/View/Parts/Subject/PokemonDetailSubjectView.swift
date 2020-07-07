//
//  PokemonDetailSubjectView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/07/05.
//

import SwiftUI

struct PokemonDetailSubjectView: View {

    let name: String
    let number: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No.\(self.number)")
            Text(self.name)
        }
    }
}

struct PokemonDetailSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailSubjectView(name: "Pikachu", number: 1)
    }
}
