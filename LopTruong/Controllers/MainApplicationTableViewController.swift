//
//  MainApplicationTableViewController.swift
//  LopTruong
//
//  Created by NeilPhung on 8/14/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import UIKit

class MainApplicationTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        

        return cell
    }


}
