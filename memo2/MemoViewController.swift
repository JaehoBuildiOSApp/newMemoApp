//
//  MemoViewController.swift
//  memo2
//
//  Created by Jaeho Jung on 11/15/21.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentlabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        contentlabel.text = note

    }

}
