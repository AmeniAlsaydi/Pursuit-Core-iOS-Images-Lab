//
//  User.swift
//  Images-Lab
//
//  Created by Amy Alsaydi on 12/9/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Name
    let email: String
    let dob: DateInfo
    let phone: String
    let cell: String 
    let location: AddressInfo
    let picture: picInfo
    
}
struct picInfo: Codable {
    let large: String
    let thumbnail: String 
}

struct Name: Codable  {
    let first: String
    let last: String
}

struct DateInfo: Codable {
    let date: String
    let age: Int
}

struct AddressInfo: Codable {
    let street: StreetInfo
    let city: String
    let state: String
    let country: String
    // let postcode: Int
}

struct StreetInfo: Codable {
    let number: Int
    let name: String
}
