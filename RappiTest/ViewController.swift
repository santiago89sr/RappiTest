//
//  ViewController.swift
//  RappiTest
//
//  Created by Santiago Rodriguez on 6/06/17.
//  Copyright © 2017 Santiago Rodriguez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var categories = ["Popular","Top Rated","Upcoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        
        cell.category.text = categories[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let moviesList = navigationController?.storyboard?.instantiateViewController(withIdentifier: "MoviesListViewController") as! MoviesListViewController
        
        globals.category = categories[indexPath.row]
        
        navigationController?.pushViewController(moviesList, animated: true)
        
        
        
    }
}

