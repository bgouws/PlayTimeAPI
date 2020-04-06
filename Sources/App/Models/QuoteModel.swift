//
//  QuoteModel.swift
//  App
//
//  Created by Brandon Gouws on 2020/04/06.
//

import Foundation
import Vapor

struct Quote: Content {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var quote: String
}
