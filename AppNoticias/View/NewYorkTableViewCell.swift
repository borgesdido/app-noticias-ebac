//
//  NewYorkTableViewCell.swift
//  AppNoticias
//
//  Created by Diego Araújo Borges on 17/06/22.
//

import UIKit
import Foundation

class NewYorkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var by: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageNews.layer.cornerRadius = 10
        imageNews.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
