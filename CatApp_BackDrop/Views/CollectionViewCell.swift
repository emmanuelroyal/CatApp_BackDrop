//
//  CollectionViewCell.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/13/21.
//

import UIKit
protocol collectionViewCellDelegate: AnyObject {
    func didTapRemoveBtn(with index: Int)
}

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    weak var delegate: collectionViewCellDelegate?
    private var catModels: catMod?
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var like: UIButton!
    
    @IBAction func isUnliked(_ sender: Any) {
        guard let items = catModels  else  { return }
        delegate?.didTapRemoveBtn(with: tag)
        }
        
    
    func setup(with cat: catMod) {
        let image = try? cat.image.asURL()
        catImage.kf.setImage(with: image)
        catName.text = cat.name
        self.catModels = cat
    }
}
