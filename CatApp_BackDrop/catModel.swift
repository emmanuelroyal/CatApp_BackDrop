//
//  catModel.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/10/21.
//

import Foundation

struct  catModel : Codable, Hashable {
        let id: String
        let image: Image?
        let name: String
}
    // MARK: - Image
struct Image : Codable, Hashable {
        let height: Int?
        let id: String?
        let url: String?
        let width: Int?
    }

