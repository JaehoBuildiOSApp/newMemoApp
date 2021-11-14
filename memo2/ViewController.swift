//
//  ViewController.swift
//  memo2
//
//  Created by Jaeho Jung on 11/15/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var memos: [(title: String, memo: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        title = "개의 메모"
    }

    @IBAction func didTapNewMemo() {
        guard let vc = storyboard?.instantiateViewController(identifier: "EntryViewController") as? EntryViewController else {
            return
        }
        vc.title = "새 메모"
        vc.completion = { noteTitle, content in
            self.navigationController?.popViewController(animated: true)
            self.memos.append((title: noteTitle, content))
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = memos[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let memo = memos[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "MemoViewController") as? MemoViewController else {
            return
        }
        vc.title = "메모"
        vc.noteTitle = memo.title
        vc.note = memo.memo
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

