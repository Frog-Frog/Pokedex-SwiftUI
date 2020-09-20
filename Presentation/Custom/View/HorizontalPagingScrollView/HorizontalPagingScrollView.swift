//
//  HorizontalPagingScrollView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/07/07.
//

import SwiftUI

struct HorizontalPagingScrollView<T: View>: View {

    @State var index: Int = 0
    @State private var offsetX: CGFloat = 0

    let contentViews: [T]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< self.contentViews.count) { index in
                        self.contentViews[index]
                    }
                }
            }
            .content.offset(x: self.offsetX)
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .gesture(DragGesture()
                        .onChanged({ value in  // Dragを監視。Dragに合わせて、スクロールする。
                            self.offsetX = value.translation.width - geometry.size.width * CGFloat(self.index)
                        })
                        .onEnded({ value in // Dragが完了したら、Drag量に応じて、indexを更新
                            let scrollThreshold = geometry.size.width / 2
                            if value.predictedEndTranslation.width < -scrollThreshold {
                                self.index = min(self.index + 1, self.contentViews.endIndex - 1)
                            } else if value.predictedEndTranslation.width > scrollThreshold {
                                self.index = max(self.index - 1, 0)
                            }

                            withAnimation { // 更新したindexの画像をアニメーションしながら表示する。
                                self.offsetX = -geometry.size.width * CGFloat(self.index)
                            }
                        })
            )
        }
    }
}
