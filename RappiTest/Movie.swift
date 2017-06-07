//
//  Movie.swift
//  RappiTest
//
//  Created by Santiago Rodriguez on 7/06/17.
//  Copyright © 2017 Santiago Rodriguez. All rights reserved.
//

import UIKit

class Movie: NSObject {

    var title:String
    var poster_path:String
    var overview:String
    var vote_average:Double
    
    init(title: String,poster_path:String,overview:String,vote_average:Double) {
        self.title = title
        self.poster_path = poster_path
        self.overview = overview
        self.vote_average = vote_average
    }
    
}
