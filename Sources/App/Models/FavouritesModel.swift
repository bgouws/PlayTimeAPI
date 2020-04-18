//
//  FavouritesModel.swift
//  App
//
//  Created by Brandon Gouws on 2020/04/06.
//

import Foundation
import Vapor

struct FavList: Content {
    var favList: [Favourites]
}

struct Favourites: Content {
    var id: String
    var trackTitle: String?
    var trackArtist: String?
}
