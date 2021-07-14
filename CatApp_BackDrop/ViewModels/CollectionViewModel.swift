//
//  collectionViewModel.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/14/21.
//

import Foundation
import RealmSwift

class CollectionViewModel {
    let realm = try! Realm()
    var data:[catMod]{realm.objects(catMod.self).map({ $0 })}
    var completion: (()-> Void)?
    
    func delete(index: Int) {
        let selected = data[index]
        RealmService.shared.delete(selected)
        completion?()
    }
    
//    func getData() {
////        self.data = realm.objects(catMod.self).map({ $0 })
//        completion?()
//    }
}
