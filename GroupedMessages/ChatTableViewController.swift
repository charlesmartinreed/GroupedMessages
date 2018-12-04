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
    let timeStamp: Date
}

extension Date {
    //custom dates for our message timestamps
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ChatTableViewController: UITableViewController {

    private let cellId = "id123"
    //storing dummy data in 2D arrays for easier sectioning
    let chatMessages = [
        [
            ChatMessage(contents: "Here's my very first message", isIncoming: true, timeStamp: Date.dateFromCustomString(customString: "08/03/2018")),
            ChatMessage(contents: "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?", isIncoming: false, timeStamp: Date.dateFromCustomString(customString: "08/03/2018"))
        ],
        [
            ChatMessage(contents: "Here's my very first message", isIncoming: false, timeStamp: Date.dateFromCustomString(customString: "08/05/2018")),
            ChatMessage(contents: "I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore? Here's my very first message I'm going to message another long message that should word wrap. Pretty sure lorem ipusum would've been a good implementation for this tutorial, but maybe that's no cool anymore?", isIncoming: true, timeStamp: Date.dateFromCustomString(customString: "08/05/2018")),
            ChatMessage(contents: "One last message for the road. Thanks for that!", isIncoming: true, timeStamp: Date.dateFromCustomString(customString: "08/05/2018"))
        ],
        [
            ChatMessage(contents: "Get at me, dawg!", isIncoming: false, timeStamp: Date.dateFromCustomString(customString: "08/17/2018")),
            ChatMessage(contents: "This message is on the left, in white", isIncoming: true, timeStamp: Date.dateFromCustomString(customString: "08/17/2018")),
            ChatMessage(contents: "This message is on the right, in black", isIncoming: false, timeStamp: Date.dateFromCustomString(customString: "08/17/2018"))
        ]
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
        
        return chatMessages[section].count //using section as our index, we can get number of items in an internal array
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count //should be 3 right now
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let firstMessageInSection = chatMessages[section].first else { return "Section: \(Date())" }
        
        //formatting the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: firstMessageInSection.timeStamp)
        
        return dateString
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        
        //cell.messageLabel.text = chatMessage.contents
        
        //cell.isIncoming = chatMessage.isIncoming //odd number rows are "outgoing" or light colored
        
        return cell
    }

}

