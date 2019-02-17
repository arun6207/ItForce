//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Amuri Arun Kumar on 2/17/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    // MARK: properties
    var employeeTableView: UITableView!
    var employeeDetails: [Employee]?
    // MARK: ViewController LieCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEmployeeTablView()
        addNavigationItem()
        registerNotification()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let emp = EmployeeDirectory()
        emp.update()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: "kEmployeeDirectoryDidUpdateNotification"),
            object: nil)
    }
    // MARK: UINavigtaionBar Configuration methods
    func addNavigationItem(){
        let barButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortEmpName))
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func sortEmpName(){
        if let emplDirectory =  self.employeeDetails {
            self.employeeDetails = emplDirectory.sorted(by: { $0.name < $1.name })
            employeeTableView.reloadData()
        }
    }
    // MARK: TableView Configuration methods
    func configureEmployeeTablView() {
        employeeTableView  = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        employeeTableView.register(EmpTableViewCell.self, forCellReuseIdentifier: "Cell")
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        self.view.addSubview(employeeTableView)
    }
}
// MARK: DataModel methods
extension HomeViewController {
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.saveDate(obj:)), name: NSNotification.Name(rawValue: "kEmployeeDirectoryDidUpdateNotification"), object: nil)
    }
    @objc func saveDate(obj: NSNotification) {
        if let empObj  = obj.object as? EmployeeDirectory {
            if let employees = empObj.employees as? [Employee] {
                self.employeeDetails = employees
                employeeTableView.reloadData()
            }
            
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? EmpTableViewCell {
            if let emp = employeeDetails?[indexPath.row] {
                cell.employeNameLabel.text = emp.name
                cell.employeeSalaryLabel.text = "\(emp.updateSalaryCurrnecy(emp))"
                cell.employeeDOBLabel.text = "\(emp.birthYear)"
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
