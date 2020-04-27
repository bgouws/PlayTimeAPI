//
//  QuoteModel.swift
//  App
//
//  Created by Brandon Gouws on 2020/04/06.
//

import Foundation
import Vapor

struct QuotesList: Content {
    var allQuotes: [Quote]
}

struct Quote: Content, Encodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var quote: String
}

struct QuoteJson: Encodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var quote: String
}
