//
//  ViewController.swift
//  DRHTableViewTutorial
//
//  Created by Stanislav Ostrovskiy on 9/24/16.
//  Copyright © 2016 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class DRHTableViewController: UIViewController {

    private let dataSource = DRHTableViewDataModel()
    
    fileprivate var dataArray = [DRHTableViewDataModelItem]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(DRHTableViewCell.nib, forCellReuseIdentifier: DRHTableViewCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        dataSource.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        dataSource.requestData()
    }
    

}

extension DRHTableViewController: UITableViewDelegate {
    
}

extension DRHTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DRHTableViewCell.identifier, for: indexPath) as? DRHTableViewCell {
            
            cell.configureWithItem(item: dataArray[indexPath.item])
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
}

extension DRHTableViewController: DRHTableViewDataModelDelegate {
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func didRecieveDataUpdate(data: [DRHTableViewDataModelItem]) {
        dataArray = data
    }
}
