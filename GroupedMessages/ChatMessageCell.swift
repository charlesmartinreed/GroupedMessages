//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Charles Martin Reed on 12/3/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    //MARK:- Cell Properties
    let messageLabel = UILabel() //represents a text message, add to cell to make visible
    let bubbleBackgroundView = UIView()
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.contents
        }
    }
    
    var isIncoming: Bool! {
        didSet {
//            bubbleBackgroundView.backgroundColor = isIncoming ? .white : .darkGray
//            messageLabel.textColor  = isIncoming ? .black : .white
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        //MARK:- Background view setup
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        messageLabel.text = "This is a long string that should wrap onto the next line. If we do this correctly, that is. Maybe even wrap onto the third line if I do this correctly and blather on for far longer than I need to."
        messageLabel.numberOfLines = 0
        //messageLabel.backgroundColor = .green
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK:- autolayout constraints for our label
        //larger constants on the messageLabel constraints pushes the conent further into the cell, increasing perceived distance between individual cells
        //widthAnchor = cell width
        let constraints =
            [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        //MARK:- autolayout constraints for our background view
        //after adding subview of messageLabel because they are derived from messageLabel
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
