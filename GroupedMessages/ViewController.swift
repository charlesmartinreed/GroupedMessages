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
    let textMessages = [
        "Here's my very first message",
        "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?",
        "Here's my very first message",
        "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore? Here's my very first message I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?",
        "One last message for the road. Thanks for that!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //registering our cell for dequeuing
        //registering our ChatMessageCell instead of the regular UITableViewCell
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        
    }
    
    //MARK:- Delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
//        cell.textLabel?.text = "This is a long string that should wrap onto the next line. If we do this correctly, that is. Maybe even wrap onto the third line if I do this correctly and blather on for far longer than I need to."
        cell.messageLabel.text = textMessages[indexPath.row]
        return cell
    }

}

