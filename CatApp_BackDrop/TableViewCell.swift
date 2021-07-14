//
//  TableViewCell.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/10/21.
//

import UIKit
import Kingfisher

protocol TableViewCellDelegate: AnyObject {
    func didTapAddBtn(with item: CatModelF)
    func didTapRemoveBtn(with item: CatModelF)
}

class TableViewCell: UITableViewCell {
    weak var delegate: TableViewCellDelegate?
    private var catModels: CatModelF?
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var catName: UILabel!
    
    @IBAction func isLike(_ sender: Any) {
        guard let items = catModels  else  { return }
        if items.liked == false {
            items.liked = true
            delegate?.didTapAddBtn(with: items)
        } else {
            items.liked = false
            delegate?.didTapRemoveBtn(with: items)
        }
    }
    
    private func configureLikedBtn(for selectedState: Bool) {
        likeBtn.setImage(UIImage(systemName: selectedState ? "heart.fill" : "heart"), for: .normal)
        likeBtn.tintColor = selectedState ? .red : .none
    }
    
    func configure(with model : CatModelF){
        let image = try? model.image.asURL()
        catImage.kf.setImage(with: image)
        catName.text = model.name
        configureLikedBtn(for: model.liked == true )
        self.catModels = model
    }
}
