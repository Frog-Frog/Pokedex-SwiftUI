//
//  PageControl.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/07/07.
//

import SwiftUI

struct PageControl: UIViewRepresentable {

    var currentPage: Int

    let numberOfPages: Int

    let selectedColor: UIColor = Asset.pageControlSelected.color

    let normalColor: UIColor = Asset.pageControlNormal.color

    func makeUIView(context: Self.Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = self.numberOfPages
        pageControl.currentPageIndicatorTintColor = self.selectedColor
        pageControl.pageIndicatorTintColor = self.normalColor
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = self.currentPage
    }
}
