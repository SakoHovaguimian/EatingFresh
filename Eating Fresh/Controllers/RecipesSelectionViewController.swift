//
//  RecipesSelectionViewController.swift
//  Eating Fresh
//
//  Created by Sako Hovaguimian on 9/15/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class RecipesSelectionViewController: UIViewController {

    var selectedCategory: String!
    var recipes: [Recipe]!
    let data = DataSet()
    var recipeToPass: Recipe!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension RecipesSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? RecipeCell {
            let recipe = recipes[indexPath.item]
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimmension = (width / 2) - 15
        return CGSize(width: cellDimmension, height: cellDimmension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toIngredients", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? RecipeDetailViewController {
            detailsVC.selectedType = recipeToPass
        }
    }
    
}
