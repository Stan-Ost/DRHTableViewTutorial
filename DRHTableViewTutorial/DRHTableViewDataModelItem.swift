//
//  DRHTableViewDataModelItem.swift
//  DRHTableViewTutorial
//
//  Created by Stanislav Ostrovskiy on 9/24/16.
//  Copyright © 2016 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class DRHTableViewDataModelItem {
    
    var avatarImageURL: String?
    var authorName: String?
    var date: String?
    var title: String?
    var previewText: String?
    
    init?(data: [String: String]?) {
        if let data = data, let avatar = data["avatarImageURL"], let name = data["authorName"], let date = data["date"], let title = data["title"], let previewText = data["previewText"] {
            self.avatarImageURL = avatar
            self.authorName = name
            self.date = date
            self.title = title
            self.previewText = previewText
        } else {
            return nil
        }
    }
}
