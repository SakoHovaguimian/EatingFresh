//
//  RecipeDetailViewController.swift
//  Eating Fresh
//
//  Created by Sako Hovaguimian on 9/15/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var selectedType: Recipe!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeImageView.image = UIImage(named: selectedType.imageName)
        recipeTitleLabel.text = selectedType.title
        recipeIngredientsLabel.text = selectedType.instructions
    }

}
