//
//  CollectionViewCell.swift
//  ProjectAttempt2
//
//  Created by Ryka Cumming on 27/06/2019.
//  Copyright © 2019 Ryka Cumming. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //backgroundColor = UIColor.lightGray
    }
}
