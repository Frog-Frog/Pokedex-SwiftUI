//
//  PopButton.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/09/21.
//

import SwiftUI

struct PopButton: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(
            action: {
                self.dismiss()
            },
            label: {
                Image(uiImage: Asset.buttonBack.image)
            })
    }
}

struct PopButton_Previews: PreviewProvider {
    static var previews: some View {
        PopButton()
    }
}
