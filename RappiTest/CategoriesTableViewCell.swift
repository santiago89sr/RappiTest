//
//  CategoriesTableViewCell.swift
//  RappiTest
//
//  Created by Santiago Rodriguez on 6/06/17.
//  Copyright © 2017 Santiago Rodriguez. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var category: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
