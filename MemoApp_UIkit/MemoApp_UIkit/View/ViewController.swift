//
//  ViewController.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: Any) {
        
        // 참고 블로그 https://infinitt.tistory.com/332
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddMemoViewController") as! AddMemoViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    let vm = MemoViewModel.shared
    var data: [Memo] = [
        Memo(content: "Task 1", time: Date()),
        Memo(content: "Task 2", time: Date())

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.data.removeAll()
        vm.loadMemos {
            tableView.reloadData()
        }
        
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoListCell", for: indexPath)
        let data = vm.memos[indexPath.row]
        cell.textLabel?.text = data.content
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let timeString = dateFormatter.string(from: data.time)
        cell.detailTextLabel?.text = timeString

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditMemoViewController") as! EditMemoViewController
        vc.memo = vm.memos[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
