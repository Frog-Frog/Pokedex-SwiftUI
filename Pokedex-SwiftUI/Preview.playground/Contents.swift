import UIKit
import PlaygroundSupport
@testable import Domain
@testable import Presentation

let ivysaur = PokemonListModel.Pokemon(
    name: "ivysaur",
    number: 2,
    imageUrl: PokemonImageURLGenerator.generateThumbnailURL(from: 2)
)

let view = PokemonListItemView(pokemon: ivysaur)

PlaygroundPage.current.setLiveView(view)
