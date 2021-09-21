//
//  LoadableImage.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/06/20.
//

import Foundation
import Nuke
import SwiftUI

struct LoadableImage<Placeholder: View>: View {

    @ObservedObject private var imageLoader: ImageLoader

    private let placeholder: Placeholder?

    init(url: URL?, placeholder: Placeholder? = nil) {
        self.imageLoader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        self.image.onAppear(perform: self.imageLoader.load)
    }

    private var image: some View {
        Group {
            if let image = self.imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                self.placeholder?.aspectRatio(contentMode: .fit)
            }
        }
    }
}

private class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private let url: URL?

    init(url: URL?) {
        self.url = url
    }

    func load() {
        guard let url = self.url else {
            return
        }
        ImagePipeline.shared.loadImage(with: url, completion: { result in
            switch result {
            case .success(let response):
                self.image = response.image
            case .failure:
                break
            }
        })
    }
}
