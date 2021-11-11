//
//  ViewController.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 26.10.2021.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var notes = [NoteModel]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents() {
        tableView.delegate = self
        tableView.dataSource = self
        let model = NoteModel(title: "Ekmek", note: "2x ekmek al")
        notes.append(model)
    }
    
    @IBAction func addNoteButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Segue.toNoteVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Segue.toNoteVC) {
            let destinationVC = segue.destination as! NoteViewController
            destinationVC.isEditMode = false
            destinationVC.delegate = self
        } else if (segue.identifier == Segue.toNoteVCEdit) {
            let destinationVC = segue.destination as! NoteViewController
            destinationVC.notes = notes
            destinationVC.isEditMode = true
            destinationVC.selectedIndex = selectedIndex
            destinationVC.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NotesTableViewCell
        cell.titleLabel.text = notes[indexPath.row].title
        cell.noteLabel.text = notes[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal, title: "Edit") { rowAction, indexPath in
            self.selectedIndex = indexPath.row
            self.performSegue(withIdentifier: Segue.toNoteVCEdit, sender: nil)
        }
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { rowAction, indexPath in
            self.notes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        deleteButton.backgroundColor = UIColor.brown
        return [deleteButton, editButton]
    }
    
}

extension ViewController: SecondViewControllerDelegate {

    func secondViewControllerWillPop(title: String, note: String, isEditMode: Bool) {
        let model = NoteModel(title: title, note: note)
        if isEditMode {
            self.notes[selectedIndex] = model
        } else {
            self.notes.insert(model, at: 0)
        }
        self.tableView.reloadData()
    }
    
}
