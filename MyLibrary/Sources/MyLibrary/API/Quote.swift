//
//  Quote.swift
//  
//
//  Created by Khiem Huynh on 25/8/24.
//

import Foundation

struct Quote: Decodable {
    let _id: String
    let content: String
    let author: String
    let dateAdded: String
    let dateModified: String
}
