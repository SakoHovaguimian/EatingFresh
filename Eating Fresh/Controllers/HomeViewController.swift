//
//  ViewController.swift
//  Eating Fresh
//
//  Created by Sako Hovaguimian on 9/15/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let data = DataSet()
    var categoryToPass: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoryCell {
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipesSelection", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionViewController {
            recipesVC.selectedCategory = categoryToPass
        }
    }
    
}
