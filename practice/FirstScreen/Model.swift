//
//  Model.swift
//  practice
//
//  Created by Abdylda Mamashev on 25/5/24.
//

import UIKit

struct characters: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var image: String
}
