//
//  MemoListCollectionViewCell.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/15.
//

import UIKit

class MemoListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memoTitle: UILabel!
    
    @IBOutlet weak var createdAtMemo: UILabel!
    
    func configure(_ memo: Memo) {
        memoTitle.text = "\(memo.title)"
        createdAtMemo.text = "\(memo.createdAt)"

    }
    
}
