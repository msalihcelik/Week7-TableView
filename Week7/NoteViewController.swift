//
//  NoteViewController.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 26.10.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func secondViewControllerWillPop(title: String, note: String)
}

class NoteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    var selectedTitle = ""
    var selectedNote = ""
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = selectedTitle
        noteTextField.text = selectedNote

    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        delegate?.secondViewControllerWillPop(title: titleTextField.text!, note: noteTextField.text!)
        navigationController?.popViewController(animated: true)
    }
    
}

extension ViewController: SecondViewControllerDelegate {
    func secondViewControllerWillPop(title: String, note: String) {
        self.titleArray.append(title)
        self.noteArray.append(note)
    }
}
