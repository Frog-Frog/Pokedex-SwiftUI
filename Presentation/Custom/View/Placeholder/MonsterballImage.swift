//
//  MonsterballImage.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Foundation
import SwiftUI

struct MonsterballImage: View {

    private let size: CGSize

    init(_ size: CGSize) {
        self.size = size
    }

    var body: some View {
        Image(uiImage: Asset.monsterball.image)
            .resizable()
            .frame(width: self.size.width, height: self.size.height, alignment: .center)
    }
}
