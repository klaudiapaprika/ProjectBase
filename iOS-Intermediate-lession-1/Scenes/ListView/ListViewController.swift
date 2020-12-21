//
//  ListViewControlelr.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

protocol ListViewProtocol: class {
    func reloadTable()
}

class ListViewController: UITableViewController {
    
    var model: ListViewModelInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getListOfString().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")
        cell?.textLabel?.text = model.getListOfString()[indexPath.row]
        return cell!
    }
    
}

// MARK: -extension for ListViewProtocol
extension ListViewController: ListViewProtocol{
    func reloadTable(){
        
    }
}
