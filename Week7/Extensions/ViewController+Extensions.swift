//
//  ViewController+Extensions.swift
//  Week7
//
//  Created by Mehmet Salih ÇELİK on 3.11.2021.
//

import Foundation

extension ViewController: SecondViewControllerDelegate {
    func secondViewControllerWillPop(title: String, note: String) {
        self.titleArray.insert(title, at: 0)
        self.noteArray.insert(note, at: 0)
    }
}
