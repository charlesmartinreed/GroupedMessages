//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Charles Martin Reed on 12/3/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

struct ChatMessage {
    var contents: String
    var isIncoming: Bool
}

class ViewController: UITableViewController {

    private let cellId = "id123"
    let chatMessages = [
        ChatMessage(contents: "Here's my very first message", isIncoming: true),
        ChatMessage(contents: "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?", isIncoming: false),
        ChatMessage(contents: "Here's my very first message", isIncoming: false),
        ChatMessage(contents: "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore? Here's my very first message I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?", isIncoming: true),
        ChatMessage(contents: "One last message for the road. Thanks for that!", isIncoming: true),
        ChatMessage(contents: "Get at me, dawg!", isIncoming: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //registering our cell for dequeuing
        //registering our ChatMessageCell instead of the regular UITableViewCell
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    //MARK:- Delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        let chatMessage = chatMessages[indexPath.row]
        cell.chatMessage = chatMessage
        
        //cell.messageLabel.text = chatMessage.contents
        
        //cell.isIncoming = chatMessage.isIncoming //odd number rows are "outgoing" or light colored
        
        return cell
    }

}

