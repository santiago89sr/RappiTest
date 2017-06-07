//
//  MoviesListViewController.swift
//  RappiTest
//
//  Created by Santiago Rodriguez on 6/06/17.
//  Copyright © 2017 Santiago Rodriguez. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class MoviesListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    
    var moviesArray:Array = [Movie]()
    var filterMoview:Array = [Movie]()
    var isFiltered:Bool!
    
    
    @IBOutlet weak var collectionMovies: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var searchView: UIVisualEffectView!
    @IBOutlet weak var searchText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add gesture to searchview
        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(self.tapView(_:)))
        searchView.addGestureRecognizer(tapGesture)
        
        //textDidChange
        searchText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    func tapView(_ sender: UITapGestureRecognizer) {
        print("Tap View!")
        searchView.isHidden = true
        searchText.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            textField.text = "SEARCH"
            isFiltered = false
            collectionMovies.reloadData()
        }
    }
    
    func textFieldDidChange(_ textField: UITextField){
        
        if textField.text?.isEmpty == true{
            isFiltered = false
        }else{
            isFiltered = true
            self.filterMoview.removeAll()
            
            for movie:Movie in moviesArray {
                
                let title = movie.title.range(of: textField.text!, options: .caseInsensitive)
                let overview = movie.overview.range(of: textField.text!, options: .caseInsensitive)
                if title != nil || overview != nil{
                    
                    filterMoview.append(movie)
                }
                
            }
            
        }
        
        collectionMovies.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchView.isHidden = true
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        isFiltered = false
        categoryLabel.text = globals.category
        
        var url = ""
        
        if globals.category == "Popular" {
            url = "http://api.themoviedb.org/3/discover/movie?certification_country=US&sort_by=popularity.desc&api_key=cb10f424c55efc51761442a5b3d60711"
        }else if globals.category == "Upcoming"{
            url = "http://api.themoviedb.org/3/discover/movie?certification_country=US&sort_by=release_date.desc&api_key=cb10f424c55efc51761442a5b3d60711"
        }else{
            url = "http://api.themoviedb.org/3/discover/movie?certification_country=US&primary_release_year=2017&sort_by=vote_average.desc&api_key=cb10f424c55efc51761442a5b3d60711"
        }
        
        Alamofire.request(url).responseJSON { response in
            
            if let JSON = response.result.value as? NSDictionary{
                //print("JSON: \(JSON)")
                let results = JSON["results"] as! NSArray
                //print(results)
                print("numero de items: \(results.count)")
                //self.collectionMovies.reloadData()
                
                self.moviesArray.removeAll()
                
                for result in results{
                    let dict = result as! NSDictionary
                    
                    let title = dict.object(forKey: "title") as? String
                    let poster_path = dict.object(forKey: "poster_path") as? String
                    let overview = dict.object(forKey: "overview") as? String
                    let vote_average = dict.object(forKey: "vote_average") as? Double
                    
                    let movie:Movie!
                    
                    if poster_path == nil{
                        movie = Movie (title: title!, poster_path: "https://www.lily-bearing.com/wp-content/themes/theme/front/dist/images/default.png", overview: overview!, vote_average: vote_average!)
                    }else{
                        movie = Movie (title: title!, poster_path: "https://image.tmdb.org/t/p/w500/"+poster_path!, overview: overview!, vote_average: vote_average!)
                    }
                    
                    
                    
                    self.moviesArray.append(movie)
                    
                }
                
                self.collectionMovies.reloadData()
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltered{
            return filterMoview.count
        }else{
            return moviesArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        let movie:Movie!
        
        if isFiltered {
            movie = filterMoview[indexPath.row]
        }else{
            movie = moviesArray[indexPath.row]
        }
        
        let poster_path = movie.poster_path
        
        cell.image.sd_setImage(with: URL (string: poster_path))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let movie:Movie!
        
        if isFiltered {
            movie = filterMoview[indexPath.row]
        }else{
            movie = moviesArray[indexPath.row]
        }
        
        globals.movie = movie
        self.searchText.text = "SEARCH"
        
        let movieView = navigationController?.storyboard?.instantiateViewController(withIdentifier: "MovieViewController") as? MovieViewController
        
        navigationController?.pushViewController(movieView!, animated: true)
        
    }
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
        
        searchView.isHidden = false
        
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
