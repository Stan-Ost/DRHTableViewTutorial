//
//  DRHTableViewCell.swift
//  DRHTableViewTutorial
//
//  Created by Stanislav Ostrovskiy on 9/24/16.
//  Copyright © 2016 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class DRHTableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var authorNameLabel: UILabel?
    @IBOutlet weak var postDateLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var previewLabel: UILabel?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func configureWithItem(item: DRHTableViewDataModelItem) {
        // this method will not be created or used in this example project
        // setImageWithURL(url: item.avatarImageURL)
        authorNameLabel?.text = item.authorName
        postDateLabel?.text = item.date
        titleLabel?.text = item.title
        previewLabel?.text = item.previewText
    }
}
