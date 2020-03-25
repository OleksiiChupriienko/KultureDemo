//
//  ViewController.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 23.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var classesReserve: AllDayClasses = []
    var classes: AllDayClasses = []
    var teachers: [String] = ["All Teachers"]
    var modelController: ModelController!
    var networkService: KultureApi!
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortButton.isEnabled = false
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        setLoadingScreen()
        networkService.fetchClasses(token: modelController.userData.token) { [weak self] (classes) in
            var teachers: [String] = []
            self?.classes = classes
            self?.classesReserve = classes
            classes.forEach { (allDayClass) in
                let teacher = allDayClass.classes.teacher.name
                    teachers.append(teacher)
            }
            self?.teachers.append(contentsOf: Array(Set(teachers)))
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.removeLoadingScreen()
                self?.sortButton.isEnabled = true
            }
        }
    }
    
    @IBAction func sortButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sorting", message: "Choose a teacher to sort by", preferredStyle: .alert)
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 200,height: 200)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Sort", style: .default, handler: { [weak self] (action) in
            self?.setLoadingScreen()
            let component = 0
            let row = pickerView.selectedRow(inComponent: component)
            let predicate = pickerView.delegate?.pickerView?(pickerView, titleForRow: row, forComponent: component)
            if predicate != "All Teachers" {
                self?.classes = (self?.classesReserve.filter { $0.classes.teacher.name == predicate
                    })!
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.removeLoadingScreen()
                }
            } else {
                self?.classes = self!.classesReserve
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.removeLoadingScreen()
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath) as? ClassCell
        let selectedClass = classes[indexPath.row]
        if let cell = cell {
            cell.configure(with: selectedClass)
        }
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        teachers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        teachers[row]
    }
}

private extension ViewController {
    private func setLoadingScreen() {
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 30
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height ?? 0)
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
                
        // Sets spinner
        spinner.style = UIActivityIndicatorView.Style.medium
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()
        
        // Adds spinner to the view
        loadingView.addSubview(spinner)
        tableView.addSubview(loadingView)
    }
    
    private func removeLoadingScreen() {
        loadingView.removeFromSuperview()
        spinner.stopAnimating()
    }
}
