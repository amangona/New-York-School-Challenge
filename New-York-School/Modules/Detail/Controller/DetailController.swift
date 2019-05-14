//
//  SATController.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import UIKit

class DetailController: UITableViewController{
    
    let detailCellId = "DetailCellId"
    var detailViewModel: DetailViewModel? {
        didSet{
            self.tableView.reloadData()
        }
    }
    var dbn: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        configureTableView()
        
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        tlabel.text = self.title
        tlabel.textColor = UIColor.white
        tlabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        self.navigationItem.titleView = tlabel
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func fetchData() {
        
        DetailService.sharedInstance.fetchDetails(dbn: self.dbn!) { (detail, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to fetch schools:", err)
                    return
                }
                self.detailViewModel = DetailViewModel(detail: detail!)
            }
            
        }
        
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel?.detailDict.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailCellId, for: indexPath) as? DetailCell else{ return UITableViewCell() }
        
        if let title: [String] = detailViewModel?.detailDict.map({ $0.key }) {
            cell.cellTitle = title[indexPath.row]
        }else{
            cell.cellTitle = ""
        }
        
        if let detail: [String] = detailViewModel?.detailDict.map({ $0.value }) {
            cell.cellDetail = detail[indexPath.row]
        }else{
            cell.cellDetail = ""
        }

        return cell
        
    }
    
    fileprivate func configureTableView() {
        tableView.register(DetailCell.self, forCellReuseIdentifier: detailCellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .lightGray
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
}
