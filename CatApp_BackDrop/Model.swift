//
//  Model.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/12/21.
//

import Foundation
import RealmSwift

class CatModelF {
    var name, image: String
    var liked: Bool
    
    init(name: String, image: String, liked: Bool) {
        self.name = name
        self.image = image
        self.liked = liked
    }
}

extension CatModelF: Hashable {
    static func == (lhs: CatModelF, rhs: CatModelF) -> Bool {
        return lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(image)
    }
}

class catMod: Object {
        @objc dynamic var name: String = ""
        @objc dynamic var image: String = ""
        @objc dynamic var liked: Bool = false
}
