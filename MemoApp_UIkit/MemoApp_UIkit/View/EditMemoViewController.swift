//
//  EditMemoViewController.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/17.
//

import UIKit

class EditMemoViewController: UIViewController {

    @IBOutlet weak var memoContent: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        print("Saving ...")
        
        let newMemo = Memo(content: memoContent.text ?? "", time: Date())
        vm.editMemo(memo: self.memo!, updatedMemo: newMemo) {
            print("Memo Updated successfully")
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        print("Deleting ...")
        vm.deleteMemo(memo: self.memo!, memoIndex: self.index!) {
            print("Memo delete successfully")
            navigationController?.popViewController(animated: true)

        }
    }
    
    var memo: Memo?
    var index: Int?
    
    let vm = MemoViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let myMemo = self.memo {
            memoContent.text = myMemo.content
        }
    }

}
