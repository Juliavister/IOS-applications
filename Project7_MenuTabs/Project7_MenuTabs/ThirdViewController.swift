//
//  ThirdViewController.swift
//  Project7_MenuTabs
//
//  Created by Julia Vister on 20/04/2023.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    var teams = [String]()
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.isEditing = true
        teams += ["Jeonbuk FC","Ulsan Hyundai","Jeju United",
                  "FC Seoul","Gyeongnam FC","Incheon United",
                  "Daegu FC","Gangwon FC"]
    }
    
    @IBAction func editingToggle(_ sender:UIBarButtonItem) {
        self.TableView.isEditing = !self.TableView.isEditing
    }
    
    
    func tableView(_ tableView: UITableView,
    moveRowAt sourceIndexPath: IndexPath,
    to destinationIndexPath: IndexPath){
        let moveTeam=self.teams[sourceIndexPath.row]
        teams.remove(at:sourceIndexPath.row)
        teams.insert(moveTeam,at:destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        struct staticVariable {
            static var tableIdentifier = "TableIdentifier"}
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: staticVariable.tableIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: staticVariable.tableIdentifier)
        }
        
        let image = UIImage(named: "Green")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "Red")
        cell?.imageView?.highlightedImage = highlightedImage
        cell?.textLabel?.text = teams[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            teams.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
