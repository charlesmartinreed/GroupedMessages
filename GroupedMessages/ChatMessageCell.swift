//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Charles Martin Reed on 12/3/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel() //represents a text message, add to cell to make visible
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(messageLabel)
        messageLabel.text = "This is a long string that should wrap onto the next line. If we do this correctly, that is. Maybe even wrap onto the third line if I do this correctly and blather on for far longer than I need to."
        messageLabel.numberOfLines = 0
        messageLabel.backgroundColor = .green
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK:- autolayout constraints for our label
        let constraints = [messageLabel.topAnchor.constraint(equalTo: topAnchor),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
