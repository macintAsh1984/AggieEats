//
//  Menu.swift
//  Aggie Eats
//
//  Created by Ashley Valdez on 12/3/24.
//
import Foundation
import OrderedCollections

struct Menu : Codable, Hashable {
    let id = UUID()
    let day: String
    let locationName: String
    let coordinate: [Double]
    let menu: OrderedDictionary<String, [String]>
    
    func getTodaysLocation(_ today: String)-> String{
        if today == day{
            return locationName
        }
        return ""
    }
    
    
}
