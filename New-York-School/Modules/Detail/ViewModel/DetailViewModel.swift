//
//  SATViewModel.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import Foundation

struct DetailViewModel {
    
    let math: String
    let reading: String
    let writting: String
    let testTaken: String
    
    init(detail: Detail) {
        self.math = detail.sat_math_avg_score
        self.reading = detail.sat_critical_reading_avg_score
        self.writting = detail.sat_writing_avg_score
        self.testTaken = detail.num_of_sat_test_takers
    }
    
    var detailDict: [String:String] {
        //If had more time I would not hard code these string values
        return["math":math, "reading":reading, "writting":writting]
        
    }
    

    
}

