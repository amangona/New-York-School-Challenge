//
//  schoolCell.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import UIKit

class SchoolCell: UITableViewCell {
    
    var schoolViewModel: SchoolViewModel! {
        didSet {
            textLabel?.text = schoolViewModel.name
            detailTextLabel?.text = schoolViewModel.city
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
