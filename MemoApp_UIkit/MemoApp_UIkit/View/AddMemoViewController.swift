//
//  AddMemoViewController.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/17.
//

import UIKit

class AddMemoViewController: UIViewController {
    /* 무엇인가 입력을 받아야 하는데
    그 길이가 길어 줄 바꿈이 이루어져야 한다면
    "UITextView"
    무엇인가 입력은 받아야 하는데
    그 길이가 그렇게 길지 않다면
    "UITextField"
     */
    @IBOutlet weak var memoContent: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        print("Saving Memo ...")
        let memo = Memo(content: memoContent.text ?? "", time: Date())
        let vm = MemoViewModel.shared
        vm.addMemo(memo: memo) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
