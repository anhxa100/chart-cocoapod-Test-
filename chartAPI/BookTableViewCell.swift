//
//  BookTableViewCell.swift
//  chartAPI
//
//  Created by anhxa100 on 5/4/19.
//  Copyright © 2019 anhxa100. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private var onToggleCompleted: ((BookItem) -> Void)?
    private var book: BookItem?
    
    func configureWith(_ book: BookItem, onToggleCompleted: ((BookItem) -> Void)? = nil) {
        self.book = book
        self.onToggleCompleted = onToggleCompleted
        self.textLabel?.text = book.name
        self.accessoryType = book.isCompleted ? .checkmark : .none
    }
    
    func toggleCompleted() {
        guard let book = book else { fatalError("Book not found") }
        
        onToggleCompleted?(book)
    }

}
