//
//  schoolViewModel.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import Foundation

struct SchoolViewModel {
    
    let name: String
    let city: String
    let dbn: String
    
    init(school: School) {
        self.name = school.school_name
        self.city = school.city
        self.dbn = school.dbn
    }
    
}
