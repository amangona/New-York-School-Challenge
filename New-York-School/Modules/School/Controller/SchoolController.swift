//
//  ViewController.swift
//  New-York-School
//
//  Created by Abe Mangona on 5/13/19.
//  Copyright © 2019 Abe Mangona. All rights reserved.
//

import UIKit

class SchoolController: UITableViewController, UINavigationControllerDelegate{
    
    let schoolCellId = "schoolCellId"
    var schoolViewModels = [SchoolViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        configureTableView()
        configureNavBar()
        self.navigationController?.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func fetchData() {
        SchoolService.sharedInstance.fetchSchools { (schools, err) in
            if let err = err {
                print("Failed to fetch schools:", err)
                return
            }
            
            self.schoolViewModels = schools?.map({return SchoolViewModel(school: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: schoolCellId, for: indexPath) as? SchoolCell else{ return UITableViewCell() }
        
        cell.schoolViewModel = schoolViewModels[indexPath.row]

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailController()
        detailController.dbn = schoolViewModels[indexPath.row].dbn
        detailController.title = schoolViewModels[indexPath.row].name
        navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    fileprivate func configureTableView() {
        tableView.register(SchoolCell.self, forCellReuseIdentifier: schoolCellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .lightGray
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func configureNavBar() {
        navigationItem.title = "New York Schools"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 199/255, blue: 242/255, alpha: 1) //Would be better to exgtend UIColor and add rgb method
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
}


