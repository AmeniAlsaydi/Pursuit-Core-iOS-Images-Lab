//
//  File.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct PokemonCards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String
    let imageUrl: String
    let imageUrlHiRes: String
    let types: [String]?
    let set: String
    let weaknesses: [Weakness]?
}

struct Weakness: Decodable {
    let type: String
    let value: String
}
