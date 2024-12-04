//
//  Menu.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 12/3/24.
//
import Foundation

struct Menu : Codable {
    let day: String
    let locationName: String
    let coordinate: [Double]
    let menu: [MenuOptions]
}

struct MenuOptions : Codable {
    let option: String
    let allergens: [String]
}
