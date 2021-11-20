//
//  ViewModel.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/10/21.
//

import Foundation
import Alamofire
import RealmSwift


class ViewModel {
    var networkData = [catModel]()
    var catData = [CatModelF]()
    var itemNames = [String]()
    var completion: (() -> Void)?
    var completions: (() -> Void)?
    var data: [catMod] {realm.objects(catMod.self).map({ $0 })}
    let realm = try! Realm()
    
    func getMethod() {
        let headers: HTTPHeaders = ["x-api-key": "1da44d94-539a-489e-a0dc-93b2f4d3b76b"]
        AF.request("https://api.thecatapi.com/v1/breeds?attach_breed=0", parameters: nil, headers: headers ).validate(statusCode: 200 ..< 299).responseJSON { AFdata  in
            let datas =  AFdata.data
            if let data = datas {
                var catsJson: [catModel]?
                do {
                    catsJson = try JSONDecoder().decode([catModel].self, from: data)
                } catch {
                    debugPrint(error)
                }
                guard let cats = catsJson else { return }
                self.networkData.append(contentsOf: cats)
                self.completion?()
            }
        }
    }

    func get(){
        self.catData.removeAll()
        let realmData = data
        self.itemNames.removeAll()
        for j in self.networkData {
            for i in realmData {
                self.itemNames.append(i.name)
            }
            if self.itemNames.contains(j.name){
                if let images = j.image?.url {
                    self.catData.append(CatModelF(name: j.name, image: images , liked: true))
                }
            } else {
                if let images = j.image?.url {
                    self.catData.append(CatModelF(name: j.name, image: images , liked: false))
                }
            }
        }
        completions?()
    }
    
    func delete(item: CatModelF){
        let data = realm.objects(catMod.self).map({ $0 })
        for i in data {
            if i.image == item.image {
                RealmService.shared.delete(i)
            }
        }
    }
    
    func create(item: CatModelF){
        let ittem = catMod()
        ittem.image = item.image
        ittem.name = item.name
        ittem.liked = item.liked
        RealmService.shared.create(ittem)
    }
}
