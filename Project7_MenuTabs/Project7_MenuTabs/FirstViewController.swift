//
//  FirstViewController.swift
//  Project7_MenuTabs
//
//  Created by Julia Vister on 20/04/2023.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var teams = [String]()
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableView.backgroundColor = UIColor.
        self.TableView.isEditing = true
        teams += ["Legia Warsawa","Lech Poznan","Korona Kielce",
                  "Wisla Krakow","Gornik Zabrze","Wisla Plock",
                  "Widzew Lodz","Jagellonia Bialystock"]
    }
    
    @IBAction func editingToggle(_ sender:UIBarButtonItem){
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

