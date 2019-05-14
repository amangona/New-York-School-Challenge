//
//  SATCell.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    //This is messy!!
    
    
    var cellTitle: String? {
        didSet {
            textLabel?.text = cellTitle
        }
    }
    
    var cellDetail: String? {
        didSet {
            detailTextLabel?.text = cellDetail
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
