//
//  RecipeCell.swift
//  Eating Fresh
//
//  Created by Sako Hovaguimian on 9/15/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionImageView.layer.cornerRadius = 10
    }
    
    func configureCell(recipe: Recipe) {
        collectionImageView.image = UIImage(named: recipe.imageName)
    }
    
}
