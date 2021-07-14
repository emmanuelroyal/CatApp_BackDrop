//
//  LikedViewController.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/10/21.
//

import UIKit
import RealmSwift

class LikedViewController: UIViewController, UICollectionViewDataSource {
    private var data = [catMod]()
    let realm = try! Realm()
    var viewModel = CollectionViewModel()
    
    @IBOutlet weak var catCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catCollection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
            DispatchQueue.main.async {
                self.catCollection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                catCollection.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell
        else { return UICollectionViewCell() }
        cell.setup(with: viewModel.data[indexPath.row])
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}

extension LikedViewController: collectionViewCellDelegate {
    func didTapRemoveBtn(with index: Int) {
        self.viewModel.delete(index: index)
        viewModel.completion = {
            self.catCollection.reloadData()
            }
        }
    }
       
