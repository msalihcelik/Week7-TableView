//
//  ViewController.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 26.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var titleArray = [String]()
    var noteArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        titleArray.append("qwe")
        noteArray.append("qwe")
        titleArray.append("www")
        noteArray.append("www")
        
    }
    private func configureContents() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addNoteButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toNoteVC", sender: nil)
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//                if editingStyle == .delete {
//                    titleArray.remove(at: indexPath.row)
//                    noteArray.remove(at: indexPath.row)
//                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//                }
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toNoteVC") {
            let destinationVC = segue.destination as! NoteViewController
            destinationVC.selectedTitle = ""
            destinationVC.selectedNote = ""
            destinationVC.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal, title: "Edit") { rowAction, indexPath in
            print("qwe")
        }
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { rowAction, indexPath in
            self.titleArray.remove(at: indexPath.row)
            self.noteArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        deleteButton.backgroundColor = UIColor.brown
        return [deleteButton, editButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
}

