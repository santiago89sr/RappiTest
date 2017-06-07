//
//  MovieViewController.swift
//  RappiTest
//
//  Created by Santiago Rodriguez on 7/06/17.
//  Copyright © 2017 Santiago Rodriguez. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var vote_average: UILabel!
    @IBOutlet weak var overview: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.titleLabel.text = globals.movie.title
        self.vote_average.text = String(globals.movie.vote_average)
        self.overview.text = String(globals.movie.overview)
        self.image.sd_setImage(with: URL (string: globals.movie.poster_path))
        
        
    }

    
    @IBAction func backBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }

}
