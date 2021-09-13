//
//  FavoriTableViewCell.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 13.09.2021.
//

import UIKit

class FavoriTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pulisherLabel: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
