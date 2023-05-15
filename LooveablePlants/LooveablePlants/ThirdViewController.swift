//
//  ThirdViewController.swift
//  LooveablePlants
//
//  Created by Julia Vister on 27/04/2023.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var Plants = [String]()
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Plants += ["Cactus", "Orchid", "Hyacinth", ]
        
    }
    
    @IBAction func editingToggle(_ sender: UIBarButtonItem) {
        self.TableView.isEditing = !self.TableView.isEditing
    }
    
    func tableView(_ tableView: UITableView,
    moveRowAt sourceIndexPath: IndexPath,
    to destinationIndexPath: IndexPath){
        let movePlant=self.Plants[sourceIndexPath.row]
        Plants.remove(at:sourceIndexPath.row)
        Plants.insert(movePlant,at:destinationIndexPath.row)
        TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        struct staticVariable {
            static var tableIdentifier = "TableIdentifier"}
        var cell:UITableViewCell? = TableView.dequeueReusableCell(withIdentifier: staticVariable.tableIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: staticVariable.tableIdentifier)
        }
        /*let image = UIImage(named: "Green")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "Red")
        cell?.imageView?.highlightedImage = highlightedImage */
        cell?.textLabel?.text = Plants[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Plants.remove(at: indexPath.row)
            TableView.reloadData()
        }
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Plant", message: nil, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Plant name"
            }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
               if let plantName = alertController.textFields?.first?.text, !plantName.isEmpty {
                   self?.Plants.append(plantName)
                   DispatchQueue.main.async {
                       if (self?.TableView) != nil {
                           self?.TableView.reloadData()
                       }
                   }
               }
           }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alertController.addAction(addAction)
           alertController.addAction(cancelAction)
           present(alertController, animated: true, completion: nil)
    }
    
    
}
    
