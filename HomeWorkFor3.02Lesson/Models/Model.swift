//
//  Model.swift
//  HomeWorkFor3.02Lesson
//
//  Created by Федор Еронин on 08.08.2022.
//

import Foundation

struct Hero: Decodable {
    
    let id: Int
    let localizedName: String
    let primaryAttr: PrimaryAttr
    let attackType: AttackType
    let img: String
    let icon: String
    let roles: [String]
    
}

enum AttackType: String, Decodable {
    case meele = "Melee"
    case range = "Ranged"
}

enum PrimaryAttr: String, Decodable {
    case str
    case agi
    case int
}
