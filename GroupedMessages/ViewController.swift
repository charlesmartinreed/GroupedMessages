//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Charles Martin Reed on 12/3/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private let cellId = "id123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //registering our cell for dequeuing
        //registering our ChatMessageCell instead of the regular UITableViewCell
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    //MARK:- Delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        cell.textLabel?.text = "This is a long string that should wrap onto the next line. If we do this correctly, that is. Maybe even wrap onto the third line if I do this correctly and blather on for far longer than I need to."
        cell.textLabel?.numberOfLines = 0 //pushes the text down, iOS handles the sizing automagically
        return cell
    }

}

