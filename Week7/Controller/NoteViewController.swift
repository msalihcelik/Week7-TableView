//
//  NoteViewController.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 26.10.2021.
//

import UIKit

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
        if (titleTextField.text?.isEmpty == true || noteTextField.text?.isEmpty == true) {
            let alert = UIAlertController(title: "Lütfen boş alan bırakmayınız!", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            delegate?.secondViewControllerWillPop(title: titleTextField.text!, note: noteTextField.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
