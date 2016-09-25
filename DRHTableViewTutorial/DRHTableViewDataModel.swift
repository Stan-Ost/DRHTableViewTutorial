//
//  DRHTableViewDataModel.swift
//  DRHTableViewTutorial
//
//  Created by Stanislav Ostrovskiy on 9/24/16.
//  Copyright © 2016 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

protocol DRHTableViewDataModelDelegate: class {
    func didRecieveDataUpdate(data: [DRHTableViewDataModelItem])
    func didFailDataUpdateWithError(error: Error)
}

class DRHTableViewDataModel: NSObject {

    weak var delegate: DRHTableViewDataModelDelegate?
    
    func requestData() {
        
        //  this two variables will be returned from either an API call or local JSON file. For tutorial purposes, I create them here and initialise with nil.
        let data: [AnyObject]? = nil
        let error: Error? = nil
        
        if let error = error {
            delegate?.didFailDataUpdateWithError(error: error)
        } else if let data = data {
            setDataWithResponse(response: data)
        }
    }
    
    private func handleError(error: Error) {
        
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        var data = [DRHTableViewDataModelItem]()
        for item in response {
            if let drhTableViewDataModelItem = DRHTableViewDataModelItem(data: item as? [String: String]) {
                data.append(drhTableViewDataModelItem)
            }
        }
        delegate?.didRecieveDataUpdate(data: data)
    }
    
}
