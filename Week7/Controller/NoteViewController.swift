//
//  NoteViewController.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 26.10.2021.
//

import UIKit

protocol SecondViewControllerDelegate: NSObject {
    func secondViewControllerWillPop(title: String, note: String , isEditMode: Bool)
}

final class NoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    weak var delegate: SecondViewControllerDelegate?
    var isEditMode: Bool = false
    var notes = [NoteModel]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents() {
        guard notes.count != 0 else { return }
        titleTextField.text = notes[selectedIndex].title
        noteTextField.text = notes[selectedIndex].note
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let titleText = titleTextField.text else { return }
        guard let noteText = noteTextField.text else { return }
        if (titleText.isEmpty || noteText.isEmpty) {
            let alert = UIAlertController(title: "Lütfen boş alan bırakmayınız!", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            if isEditMode {
                delegate?.secondViewControllerWillPop(title: titleTextField.text!, note: noteTextField.text!, isEditMode: true)
            } else {
                delegate?.secondViewControllerWillPop(title: titleTextField.text!, note: noteTextField.text!, isEditMode: false)
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
}
