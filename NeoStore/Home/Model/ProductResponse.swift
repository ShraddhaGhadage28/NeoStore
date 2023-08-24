//
//  ProductResponse.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 21/08/2023.
//

import Foundation

struct ProductResponse:Codable {
    let status : Int?
    let data : [Product]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        data = try values.decodeIfPresent([Product].self, forKey: .data)
    }
   

}
