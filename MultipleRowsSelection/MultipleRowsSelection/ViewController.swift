//
//  ViewController.swift
//  MultipleRowsSelection
//
//  Created by chaitanya on 28/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - TableView Data
    let swiftTopics = ["Varibles","DataTypes","Conditional Statements", "Loops","Functions","Class & Structures","Clousures","Protocols & Delegate","Optionals","CollectionTypes",]
    
    // MARK: - Empty Array Declaration
    var selectedCells:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = swiftTopics[indexPath.row]
        cell?.accessoryType = self.selectedCells.contains(indexPath.row) ? .checkmark : .none // Short Hand if else Statement
        cell?.backgroundColor = self.selectedCells.contains(indexPath.row) ? UIColor.systemTeal : UIColor.clear
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.selectedCells.contains(indexPath.row) {
            let index = self.selectedCells.firstIndex(of: indexPath.row)
            self.selectedCells.remove(at: index!)
        }else {
            self.selectedCells.append(indexPath.row)
        }
        tableView.reloadData()
    }
}
