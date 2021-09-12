//
//  BookTableViewCell.swift
//  BooksCallAPI
//
//  Created by Hamed Amiry on 12.09.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configer(at viewModel: ViewCellModel){
        
        bookNameLabel.text = viewModel.name
        bookPublisherLabel.text = viewModel.publisher
        
        DownloadImage.imageDowloag(string: viewModel.image) { [weak self]  data in
            DispatchQueue.main.async {
                let imgae = UIImage(data: data)
                self?.bookImage.image = imgae
            }
        }

       
        
        
    }
    
 
    
}
